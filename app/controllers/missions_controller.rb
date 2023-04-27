class MissionsController < ApplicationController
  def index
    @missions = current_user.missions
  end

  def show
    @missions = Mission.find(params[:id])
  end
end
