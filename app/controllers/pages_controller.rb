class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def scan

    # aquí tengo que implantar la logica de actualizar el qr_code de los users
    # if current_user.qr_code.empty?
    #   current_user.update(qr_code: SecureRandom.hex(10))

    # esto estará dividido en varios metodos

    # si el usuario no tiene codigo asignado
    # 1. comprobar que el usuario no tiene codigo asignado
    # 2. guardar el codigo de la url en la columna qr del usuario

    # si el usuario tiene codigo asignado

  end
end
