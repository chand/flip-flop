class IssuesController < ApplicationController

  def index
    @issues = Issue.order("name asc")
    @twitter_gunlaws = Issue.friendly.find_by(id: 1)
    @twitter_immigration = Issue.friendly.find_by(id: 2)
    @twitter_lgbtq = Issue.friendly.find_by(id: 3)
    @twitter_economy = Issue.friendly.find_by(id: 4)
    @twitter_healthcare = Issue.friendly.find_by(id: 5)

    @congress_gunlaws = Category.friendly.find_by(id: 1)
    @congress_immigration = Category.friendly.find_by(id: 2)
    @congress_lgbtq = Category.friendly.find_by(id: 3)
    @congress_economy = Category.friendly.find_by(id: 4)
    @congress_healthcare = Category.friendly.find_by(id: 5)
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
