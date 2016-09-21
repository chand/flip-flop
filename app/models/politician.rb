class Politician < ActiveRecord::Base
  has_many :interests
  has_many :issues, through: :interests

  validates :name, :political_party, :title, :twitter_handle, :slug, :twitter_profile, presence: true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end

  ## The following 2 grey'ed out methods give us access to all 3200 tweets. Careful, the load time is long.

  # def collect_with_max_id(collection=[], max_id=nil, &block)
  #   response = yield(max_id)
  #   collection += response
  #   response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)

  # def CLIENT.get_all_tweets(politician)
  #   collect_with_max_id do |max_id|
  #   options = {count: 200, include_rts: true}
  #   options[:max_id] = max_id unless max_id.nil?
  #   user_timeline(politician, options)
  #   end
  # end

  #The following method gives us the most recent 200 tweets, hence faster load time:

  def all_tweets
    options = {:count => 250, :include_rts => true}
    CLIENT.user_timeline(twitter_handle, options)
  end

  def tweet_mentions_issue(tweet, issue)
    issue.keywords.any? { |keyword| tweet_contains_keyword(tweet, keyword) }
  end

  def tweet_contains_keyword(tweet, keyword)
    tweet.full_text.include?(keyword)
  end

  def issue_tweet_count(issue)
    all_tweets.count { |tweet| tweet_mentions_issue(tweet, issue) }
  end

  def issues_mention_counts
    self.issues.map do |issue|
      issue_tweet_count(issue)
    end
  end

  def issue_tweets(the_issue)
    result_bucket = []
    self.all_tweets.each do |tweet|
      self.issues.each do |issue|
        if issue.name.downcase == the_issue.downcase
          issue.keywords.each do |keyword|
            if tweet.full_text.include?(keyword) && result_bucket.include?(tweet) == false
              result_bucket << tweet
            end
          end
        end
      end
    end
    result_bucket
  end



  def self.search(search)
    if search
      Politician.where('LOWER(name) LIKE ?', "%#{search.downcase}%")
    end
  end


end

