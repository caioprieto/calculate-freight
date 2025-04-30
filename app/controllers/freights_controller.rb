class FreightsController < ApplicationController
  def index
    set_freights
    @address_origem ||= {}
    @address_destino ||= {}
  end

  def calcular_frete
    cep_origem = format_cep(params[:cep_origem])
    cep_destino = format_cep(params[:cep_destino])

    calculate_service = CalculateFreightService.new(cep_origem, cep_destino, params[:height], params[:width], params[:length], params[:weight], params[:service_type_id])
    search_cep_origem = SearchCepService.new(cep_origem)
    search_cep_destino = SearchCepService.new(cep_destino)

    @address_origem ||= search_cep_origem.call
    @address_destino ||= search_cep_destino.call
    @frete_calculado ||= calculate_service.call

    create_freight = CreateFreightJob.perform_now(@address_origem, @address_destino, @frete_calculado)

    if create_freight
      set_freights
      render :index
    end
  end

  private

  def set_freights
    @freights ||= Freight.all
                         .preload(:address_origem, :address_destino)
                         .limit(7)
                         .order(created_at: :desc)
  end

  def format_cep(cep)
    cep.to_s.strip.gsub("-", "")
  end
end
