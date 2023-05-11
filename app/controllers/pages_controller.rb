class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def admin
  end

  def execute_seeds
    load "#{Rails.root}/db/seeds.rb"
    redirect_to root_path
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

      # condicion que dentro de mis mis misiones, el target escaneado sea diferente a mi mision actual
      #  mensaje = esta mision no es tuya
      elsif current_user.missions.none? { |mission| mission.target_user.qr == params[:qr] }
        @mensaje = "Esta misión no es tuya, tonta."

      elsif current_user.missions.any? { |mission| mission.target_user.qr == params[:qr] && mission.status == "completed" }
        @mensaje = "Ya has ganado esta mision, tonta."

      elsif
        @other_mission.present? && @other_mission.status == "completed"
        @mensaje = "QUE HAS PERDIDO, DEJA DE ESCANEAr ya porfavor"
      else
        # Actualizar mision actual como completada en todas sus copias
        current_user.missions.last.update(status: "completed", winner_user: current_user)
        #  aqui buscar la mision del otro pavo / o otros pavos y ponersela como ganada (no poner el winner pq pal recuento es mas facil quitarme las que estan nil por defecto)

        @mensaje = "Has completado la misión!"

        # Obtener siguiente mision
        @mission = Mission.find_by(user: @user)

        @new_mission = @mission.dup
        @new_mission.update(user: current_user)

        # (Escenario contemplado en Notion) Aquí tengo que encontrar la misión donde target user, sea el mismo, y duplicar la mision para las personas que tengan ese target.
        #  la mision es @mision
      end
    end
  end
end
