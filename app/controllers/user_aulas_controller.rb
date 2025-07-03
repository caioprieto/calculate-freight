class UserAulasController < ApplicationController
  def create
    curso_id = params[:curso_id]
    aula_id =  params[:aula_id]

    @user_aula = UserAula.find_or_initialize_by(user_id: current_user.id, aula_id: aula_id, curso_id: curso_id)
    @user_aula.watched = params[:watched]
    @user_aula.save

    @user_curso = @user_aula.user.user_cursos.where(curso_id: curso_id).first
    @user_curso.calculate_values

    render json: { id: @user_aula.id }
  end

  def update
    @user_aula = UserAula.find_by(id: params[:id], user_id: current_user.id)

    if @user_aula&.update(watched: params[:watched])
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end
end
