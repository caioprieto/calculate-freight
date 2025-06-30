class Admin::CursosController < AdminsBackofficeController
  before_action :set_curso, only: %i[edit update]

  def index
    @cursos = Curso.order(updated_at: :desc)
  end

  def new
    @curso = Curso.new
  end

  def create
    @curso = Curso.new(curso_params)
    if @curso.save!
      flash[:alert] = "Curso criado com sucesso!"
      render :edit, notice: "Curso criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @curso.present? && @curso.aulas.present?
      @redacoes = Word.where(id: @curso.aulas.where.not(word_id: nil).pluck(:word_id))
    end
  end

  def update
    if params[:curso][:remove_imagem] == "1"
      @curso.imagem.purge
    end

    if @curso.update(curso_params)
      flash[:alert] = "Curso atualizado com sucesso!"
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

  private

  def curso_params
    params.require(:curso).permit(
      :name, :description, :prova, :tipo, :imagem, :remove_imagem, :value, :value_riscado, :vigencia,
      modulos_attributes: [
        :id, :titulo, :description, :_destroy,
        aulas_attributes: [
          :id, :titulo, :description, :video, :word_id, :_destroy
        ]
      ]
    )
  end

  def set_curso
    @curso = Curso.find(params[:id])
  end
end
