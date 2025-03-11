class FreightsController < ApplicationController
  def index
    @freights = Freight.all
    @address ||= {}
  end

  def calcular_frete
    cep_format = params[:cep_destino].to_s.strip.gsub('-', '')
    calculate_service = CalculateFreightService.new(cep_format, params[:height], params[:width], params[:length], params[:weight], params[:service_type_id])
    search_cep_service = SearchCepService.new(cep_format)

    @frete_calculado = calculate_service.call
    @address = search_cep_service.call

    render :index
  end
end
