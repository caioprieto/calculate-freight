class CreateFreightJob < ApplicationJob
  queue_as :default

  def perform(origem, destino, freight_value)
    origem = Address.find_or_create_by(cep: origem[:cep], rua: origem[:street], bairro: origem[:bairro], cidade: origem[:city], estado: origem[:state])
    destino = Address.find_or_create_by(cep: destino[:cep], rua: destino[:street], bairro: destino[:bairro], cidade: destino[:city], estado: destino[:state])

    Freight.create(
      address_origem: origem,
      address_destino: destino,
      nome_do_serviço: freight_value["name"],
      compania: freight_value["company"]["name"],
      moeda: freight_value["currency"],
      preço_final: freight_value["price"],
      tempo_estimado: freight_value["delivery_time"]
    )
  end
end