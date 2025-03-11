class FreightsController < ApplicationController
  def index
    @freights = Freight.all
  end

  def calcular_frete
    service = CalculateFreightService.new(params[:cep_destino], params[:height], params[:width], params[:length], params[:weight], params[:service_type_id])
    @frete_calculado = service.call

    render :index
  end
end