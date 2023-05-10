class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def scan
    @user_mission = current_user.missions.last
    @other_mission = Mission.where(challenge: @user_mission.challenge, target_user: @user_mission.target_user).where.not(user: current_user).last

    if current_user.qr.nil?
      current_user.update(qr: params[:qr])

    elsif current_user.qr == params[:qr]
      @mensaje = "Ya has registrado tu propio qr, tonta."

    elsif current_user.qr != params[:qr] && params[:qr].present?

      @user = User.find_by(qr: params[:qr])

      if @user.nil?
        @mensaje = "El qr que has escaneado no está asociado a ningún usuario."

      elsif current_user.missions.any? { |mission| mission.target_user.qr == params[:qr] && mission.status == "completed" }
        @mensaje = "Ya has escaneado este qr de esta mision, tonta."

      else
        current_user.missions.last.update(status: "completed", winner_user: current_user)
        @mission = Mission.find_by(user: @user)
        @new_mission = @mission.dup
        @new_mission.update(user: current_user)
        @mensaje = "Has completado la misión!"
      end
    end
  end
end
