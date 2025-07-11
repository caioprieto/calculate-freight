class TemasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @tema = Tema.find(params[:id])

    unless @tema.pdf_file.attached?
      redirect_back fallback_location: root_path, allow_other_host: false
      flash[:alerta] = "Esse tema está sem PDF!"
    end
  end
end
