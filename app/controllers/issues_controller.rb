class IssuesController < ApplicationController

  def index
    @issues = Issue.order("name asc")
    @twitter_gunlaws = Issue.friendly.find_by(id: 1)
    @twitter_immigration = Issue.friendly.find_by(id: 2)
    @twitter_lgbtq = Issue.friendly.find_by(id: 3)
    @twitter_economy = Issue.friendly.find_by(id: 4)
    @twitter_healthcare = Issue.friendly.find_by(id: 5)
    @congress_gunlaws = Issue.find(1)
    @congress_immigration = Issue.find(2)
    @congress_lgbtq = Issue.find(3)
    @congress_economy = Issue.find(4)
    @congress_healthcare = Issue.find(5)
  end

  def show
     if params.has_key?(:search)
        @politicians = Politician.search(params[:search])
     else
        @issue = Issue.friendly.find(params[:id])
        @politicians = @issue.politicians
     end
  end

end
