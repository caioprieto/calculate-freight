class Admin::TemasController < AdminsBackofficeController
  def index
    @temas = ::Tema.all
  end
  def new
    @tema = ::Tema.new
  end

  def create
    if @tema = ::Tema.create(tema_params)
      render :edit, notice: "Tema criado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @tema = ::Tema.find(params[:id])
  end

  def update
    @tema = Tema.find(params[:id])

    if @tema.update(tema_params)
      redirect_to edit_admin_tema_path(@tema), notice: "Tema atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def tema_params
    params.require(:tema).permit(:pdf_file, :name, :capa, :prova)
  end
end
