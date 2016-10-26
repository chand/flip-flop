class Category < ActiveRecord::Base
  has_many :subjects

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def party_positions
    rep_category_yes = []
    rep_category_no = []
    rep_category_total = []
    dem_category_yes = []
    dem_category_no = []
    dem_category_total = []

    rep_category_yes = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: self.name}, legislators: {party: "R"}, positions: {vote_position: "Yes"})
    rep_category_no = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: self.name}, legislators: {party: "R"}, positions: {vote_position: "No"})
    rep_category_total = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: self.name}, legislators: {party: "R"})
    dem_category_yes = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: self.name}, legislators: {party: "D"}, positions: {vote_position: "Yes"})
    dem_category_no = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: self.name}, legislators: {party: "D"}, positions: {vote_position: "No"})
    dem_category_total = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: self.name}, legislators: {party: "D"})

    rep_category_percent_yes = rep_category_yes.uniq{|position| position.id}.count.to_f / rep_category_total.uniq{|position| position.id}.count.to_f
    rep_category_percent_no = rep_category_no.uniq{|position| position.id}.count.to_f / rep_category_total.uniq{|position| position.id}.count.to_f
    dem_category_percent_yes = dem_category_yes.uniq{|position| position.id}.count.to_f / dem_category_total.uniq{|position| position.id}.count.to_f
    dem_category_percent_no = dem_category_no.uniq{|position| position.id}.count.to_f / dem_category_total.uniq{|position| position.id}.count.to_f

    {rep_yes: rep_category_percent_yes, rep_no: rep_category_percent_no, dem_yes: dem_category_percent_yes, dem_no: dem_category_percent_no}
  end


end
