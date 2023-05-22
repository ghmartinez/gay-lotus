class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :admin]

  def home
  end

  def admin
  end

  def add_missions_to_users
    Mission.destroy_all
    target_user = User.all.sample
    User.all.each do |user|
      while Mission.all.any? { |mission| mission.target_user == target_user }
        target_user = User.where.not(id: user.id).sample
      end
      Mission.create(user: user, challenge: Challenge.all.sample, target_user: target_user, status: "pending")
    end
    redirect_to admin_path
  end

  def scan
    @user_mission = current_user.missions.last
    @other_mission = Mission.where(challenge: @user_mission.challenge, target_user: @user_mission.target_user).where.not(user: current_user).last if @user_mission

    if current_user.qr.nil?
      current_user.update(qr: params[:qr])

    elsif current_user.qr == params[:qr]
      @mensaje = "Ya has registrado tu propio QR. 😒"

    elsif current_user.qr != params[:qr] && params[:qr].present?

      @user = User.find_by(qr: params[:qr])

      if @user.nil?
        @mensaje = "El QR que has escaneado no está asociado a ningún usuario. 😒"

      elsif current_user.missions.none? { |mission| mission.target_user.qr == params[:qr] }
        @mensaje = "Esta misión no te toca. 😒"

      elsif current_user.missions.any? { |mission| mission.target_user.qr == params[:qr] && mission.status == "completed" }
        @mensaje = "Ya has ganado esta misión. 😒"

      elsif @other_mission.present? && @other_mission.status == "completed"
        @mensaje = "Que has perdido ya. Deja de molestar. 😒"

      else
        current_user.missions.last.update(status: "completed", winner_user: current_user)
        @mensaje = "Has completado la misión, reina! 💁‍♀️"

        @mission = Mission.find_by(user: @user)
        @new_mission = @mission.dup
        @new_mission.update(user: current_user)

        # TODO: Encontrar las misiones con el mismo target user y ponerlas con status completed
      end
    end
  end
end
