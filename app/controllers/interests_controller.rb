class InterestsController < ApplicationController

  def show
  	 # @interest = Interest.find_by(id: params[:id], politician_id: params[:politician_id])

  	 @interest = Interest.find_by(id: params[:id])
  	

  	 # @interest = Interest.friendly.find_by(politician_name: params[politician.name])
    # @interest = Interest.find_by(id: params[:id], politician_id: params[:politician_id] )
    # @interest = Interest.friendly.find_by(id: params[:id], politician_id: params[:politician_id] )
    # @politician = Politician.find_by(id: params[:politician_id])
    # @politician = @interest.politicians.friendly.find(id: params[:politician_id])
    # @politician = Politician.friendly.find_by(id: params[:politician_id])
      # @politician = Politician.friendly.find_by(name: params[:politician_name])

       @politician = Politician.friendly.find(params[:politician_id])
    @issue = Issue.friendly.find(params[:id])

    if @politician
    else
      redirect_to root_path
    end
  end

end
