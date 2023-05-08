class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def scan
    # Al registrarse / iniciar sesión desde el qr, al usuario se le asigna un qr.
    if current_user.qr.nil?
      current_user.update(qr: params[:qr])
    # Si el usuario tiene un qr diferent al suyo y el qr está presente en el enlace:
    elsif current_user.qr != params[:qr] && params[:qr].present?
      # Actualizo el estado y el ganador de la misión del current user.
      current_user.missions.last.update(status: "completed", winner_user: current_user)

      # Encuentro al usuario que tiene asignado el qr que se ha escaneado.
      @user = User.find_by(qr: params[:qr])

      # Compruebo que el qr esté asociado a alguien.
      if @user.nil?
        @mensaje = "El qr que has escaneado no está asociado a ningún usuario."

      # Compruebo que
      elsif current_user.missions.any? do |mission|
        mission.user.qr == params[:qr]
        @mensaje = "Ya has escaneado este qr de esta nueva mision, tonta."
      end

      elsif current_user.missions.last.status == "completed"
        @mission = Mission.find_by(user: @user)
        @new_mission = @mission.dup
        @new_mission.update(user: current_user)
      end
    elsif current_user.qr == params[:qr]
      @mensaje = "Ya has registrado tu propio qr, tonta."
    end
  end
end
