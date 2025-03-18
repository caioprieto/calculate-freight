class SearchCepService
  include HTTParty

  def initialize(cep_destino)
    @cep = cep_destino
  end

  def call
    response = HTTParty.get("https://viacep.com.br/ws/#{@cep}/json/")

    if response.success?
      build_response(response)
    else
      render json: { error: 'CEP não encontrado' }, status: :not_found
    end
  end

  private

  def build_response(response)
    {
      cep: response['cep'],
      street: response['logradouro'],
      bairro: response['bairro'],
      city: response['localidade'],
      state: response['uf'],
      region: response['regiao'],
      ibge_code: response['ibge'],
      ddd: response['ddd']
    }
  end
end