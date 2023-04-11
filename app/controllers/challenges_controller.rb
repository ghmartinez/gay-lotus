class ChallengesController < ApplicationController
  def index
    @challenges = current_user.challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  # def new
  #   @challenge = Challenge.new
  # end

  # def create
  #   @challenge = Challenge.new(challenge_params)
  #   if @challenge.save
  #     redirect_to @challenge
  #   else
  #     render :new
  #   end
  # end

  # private

  # def challenge_params
  #   params.require(:challenge).permit(:name, :description, :start_date, :end_date)
  # end
end
