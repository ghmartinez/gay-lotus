class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def admin
  end

  def add_missions_to_users
    User.all.each do |user|
      target_users = User.all.where.not(id: user.id)
      target_user = target_users.sample
      Mission.create(challenge: Challenge.all.sample, user: user, target_user: target_user, status: "pending")
      target_users.delete(target_user)
    end
    redirect_to root_path
  end

  def scan
    @user_mission = current_user.missions.last
    @other_mission = Mission.where(challenge: @user_mission.challenge, target_user: @user_mission.target_user).where.not(user: current_user).last if @user_mission

    if current_user.qr.nil?
      current_user.update(qr: params[:qr])

    elsif current_user.qr == params[:qr]
      @mensaje = "Ya has registrado tu propio qr, tonta."

    elsif current_user.qr != params[:qr] && params[:qr].present?

      @user = User.find_by(qr: params[:qr])

      if @user.nil?
        @mensaje = "El qr que has escaneado no está asociado a ningún usuario."

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
        @mission = Mission.find_by(user: @user) # misión que ahora vas a hacer
        @target = @mission.target_user # usuario al que tienes que hacer la mision


        @new_mission = @mission.dup
        @new_mission.update(user: current_user)
        # (Escenario contemplado en Notion) Aquí tengo que encontrar la misión donde target user, sea el mismo, y duplicar la mision para las personas que tengan ese target.
        #  la mision es @mision

        # @misiones_a_duplicar = Mission.all.where(target_user: @target) # misiones que tienen como target al usuario al que le has hecho la mision
        # @misiones_a_duplicar.each do |mision|
        #   user = mision.user
        #   raise
        #   user.missions.create(challenge: mision.challenge, target_user: mision.target_user, status: "pending")
        # end
      end
    end
  end
end
