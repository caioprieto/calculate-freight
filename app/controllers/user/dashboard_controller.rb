class User::DashboardController < ApplicationController
  layout "user_dashboard"

  def index
    @user_cursos = current_user.user_cursos.order(progresso: :desc)
    @continuar_cursos = current_user.user_cursos.where(curso_id: current_user.user_aulas&.last.try(:curso_id))
  end
end
