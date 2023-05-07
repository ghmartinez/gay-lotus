class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def scan
    # Si el usuario no tiene qr, se lo asigno.
    if current_user.qr.nil?
      current_user.update(qr: params[:qr])
    # Si el usuario tiene qr y el qr que se ha escaneado es el suyo, no hago nada.
    elsif current_user.qr != params[:qr] && params[:qr].present?
      # Actualizo el estado y el ganador de la misión del current user.
      current_user.missions.last.status = "completed"
      current_user.missions.last.winner_user = current_user
      current_user.missions.last.save

      # Encuentro al usuario que tiene asignado el qr que se ha escaneado.
      @user = User.find_by(qr: params[:qr])
      if @user.nil?
        @amor = "El qr que has escaneado no está asociado a ningún usuario."
      else
        @mission = Mission.find_by(user: @user)
        current_user.missions.each do |mission|
          if mission.challenge == @mission.challenge && mission.target_user == @mission.target_user && mission.status == @mission.status
            @amor = "ya has escaneado este collar, sigue con tu mision hija mia del amor hermoso, tonta."
          end
        end
        @new_mission = @mission.dup
        @new_mission.user = current_user
        @new_mission.save
      end
      # Encuentro la misión que tiene asignada el usuario que tiene asignado el qr que se ha escaneado y duplico la misión.
    else
      @amor = "Ya has registrado tu propio qr, tonta."
    end
  end
end
