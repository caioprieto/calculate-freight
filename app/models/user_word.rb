class UserWord < ApplicationRecord
  belongs_to :word
  belongs_to :user
  belongs_to :curso, optional: true

  has_one_attached :user_redacao
  has_one_attached :correcao

  has_one :chat, dependent: :destroy, class_name: "::Chat"

  def prazo_entrega
    data_conclusao + 14.days
  end
end
