class UserAulasController < ApplicationController
  def create
    user_aula = UserAula.find_or_initialize_by(user_id: current_user.id, aula_id: params[:aula_id])
    user_aula.watched = params[:watched]
    user_aula.save

    head :ok
  end
end
