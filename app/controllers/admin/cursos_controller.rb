class Admin::CursosController < AdminsBackofficeController
  before_action :set_curso, only: %i[edit update]
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

  def edit; end

  def update
    if params[:curso][:remove_imagem] == "1"
      @curso.imagem.purge
    end

    if @curso.update(curso_params)
      redirect_to edit_admin_curso_path(@curso), notice: "Curso atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
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

  def add_word
    @curso = Curso.find(params[:curso_id])
    @curso.add_word(params[:word_id])

    redirect_to edit_admin_curso_path(@curso)
  end

  def remove_word
    @curso = Curso.find(params[:curso_id])
    @curso.curso_words.where(word_id: params[:word_id]).destroy_all

    redirect_to edit_admin_curso_path(@curso)
  end

  private

  def curso_params
    params.require(:curso).permit(
      :name, :description, :prova, :tipo, :imagem, :remove_imagem,
      modulos_attributes: [
        :id, :titulo, :description, :_destroy,
        aulas_attributes: [
          :id, :titulo, :description, :video, :_destroy
        ]
      ]
    )
  end

  def set_curso
    @curso = Curso.find(params[:id])
  end
end
