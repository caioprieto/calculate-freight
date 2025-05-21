class User::DashboardController < ApplicationController
  layout "user_dashboard"

  def index
    @cursos = current_user.cursos
    @last_curso = current_user.last_curso
    @progress = current_user.progress(@last_curso)
  end

  def search
    @query = params[:query]

    render json: "Deu certo!"
  end
end
