class User::ExplorarController < ApplicationController
  layout "user_dashboard"


  def index
    
    @all_cursos = Curso.all

    if params[:order_by].present?
      @all_cursos = Curso.find_by_order(params[:order_by])
    end
  end
end
