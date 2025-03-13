class FreightsController < ApplicationController
  def index
    @address_origem ||= {}
    @address_destino ||= {}
    @freights = Freight.all
  end

  def calcular_frete
    cep_origem = format_cep(params[:cep_origem])
    cep_destino = format_cep(params[:cep_destino])

    calculate_service = CalculateFreightService.new(cep_origem, cep_destino, params[:height], params[:width], params[:length], params[:weight], params[:service_type_id])

    search_cep_origem = SearchCepService.new(cep_origem)
    search_cep_destino = SearchCepService.new(cep_destino)

    @address_origem = search_cep_origem.call
    @address_destino = search_cep_destino.call
    @frete_calculado = calculate_service.call

    render :index
  end

  private

  def format_cep(cep)
    cep.to_s.strip.gsub('-', '')
  end
end
