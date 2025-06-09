class User::DashboardController < ApplicationController
  layout "user_dashboard"

  def index
    @cursos = current_user.cursos
    @user_cursos = current_user.user_cursos.order(progresso: :desc)
  end

  def search
    @query = params[:query]

    render json: "Deu certo!"
  end
end
