class MissionsController < ApplicationController
  def index
    @missions = current_user.missions
  end
end
