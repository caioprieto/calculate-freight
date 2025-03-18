class Freight < ApplicationRecord
  belongs_to :address_origem, class_name: '::Address'
  belongs_to :address_destino, class_name: '::Address'

  with_options allow_nil: true, prefix: true do
    delegate :cidade, :estado, :rua, :bairro, :cep, to: :address_origem
    delegate :cidade, :estado, :rua, :bairro, :cep, to: :address_destino
  end
end
