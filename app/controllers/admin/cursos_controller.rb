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

  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy if @curso.present?
  end

  def delete_multiple
    curso_ids = params[:curso_ids]

    if curso_ids.present?
      Curso.where(id: curso_ids).destroy_all
      redirect_to admin_cursos_path, notice: "Cursos removidos com sucesso."
    else
      redirect_to admin_cursos_path, alert: "Nenhum curso selecionado."
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
