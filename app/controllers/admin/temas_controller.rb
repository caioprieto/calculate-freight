class Admin::TemasController < AdminsBackofficeController
  def new
    @tema = ::Tema.new
  end

  def create
    if @tema = ::Tema.create(tema_params)
      redirect_to new_admin_tema_path, notice: "Curso atualizado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tema_params
    params.require(:tema).permit(:pdf_file, :name, :capa, :prova)
  end
end
