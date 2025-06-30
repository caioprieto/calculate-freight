class User::ExplorarController < ApplicationController
  layout "user_dashboard"

  def index
    @all_cursos = Curso.all

    if params[:query].present?
      @all_cursos = Curso.find_by_name(params[:query])
    end

    if params[:prova].present?
      @all_cursos = Curso.find_by_prova(params[:prova])
    end
  end
end
