class UserAulasController < ApplicationController
  def create
    user_aula = UserAula.find_or_initialize_by(user_id: current_user.id, aula_id: params[:aula_id])
    user_aula.watched = params[:watched]
    user_aula.save

    curso_id = user_aula.aula.modulo.curso_id
    user_curso = user_aula.user.user_cursos.where(curso_id: curso_id).first
    user_curso.recalculate_progress

    head :ok
  end
end
