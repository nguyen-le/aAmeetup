class VotesController < ApplicationController
  def create
    @feature = Feature.find(params[:feature_id])
    @vote    = @feature.votes.new(user_id: current_user.id)

    if @vote.save
      flash[:notice] = 'Vote was successfully created.'
      redirect_to home_url
    else
      redirect_to "/home"
    end
  end

  private

  def vote_params
  end
end
