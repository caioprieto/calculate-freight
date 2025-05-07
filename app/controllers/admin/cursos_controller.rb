class Admin::CursosController < AdminsBackofficeController
  def index
    @cursos = Curso.all
  end

  def new
    @curso = Curso.new
  end

  def create
    @curso = Curso.new(curso_params)
    if @curso.save!
      render :edit, notice: "Curso criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @curso = Curso.find(params[:id])
  end

  def update
    @curso = Curso.find(params[:id])

    if @curso.update(curso_params)
      render :edit, notice: "Curso atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def curso_params
    params.require(:curso).permit(
      :name, :description,
      modulos_attributes: [
        :id, :titulo, :description, :_destroy,
        aulas_attributes: [
          :id, :titulo, :description, :video, :_destroy
        ]
      ]
    )
  end
end
