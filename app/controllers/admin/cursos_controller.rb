class Admin::CursosController < AdminsBackofficeController
  def index
    @cursos = Curso.all
  end

  def edit
  end
end
