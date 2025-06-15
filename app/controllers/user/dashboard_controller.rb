class User::DashboardController < ApplicationController
  layout "user_dashboard"

  def index
    @user_cursos = current_user.user_cursos.order(progresso: :desc)
    @continuar_cursos = []
  end

  def search
    @query = params[:query]

    render json: "Deu certo!"
  end
end
