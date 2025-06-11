class User::ExplorarController < ApplicationController
  layout "user_dashboard"

  def index
    @all_cursos = Curso.all

    if params[:query].present?
      @cursos = Curso.find_by_name(params[:query])
    end
  end
end
