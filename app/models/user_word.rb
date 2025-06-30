class UserWord < ApplicationRecord
  belongs_to :word
  belongs_to :user
  belongs_to :curso

  has_one_attached :user_redacao
  has_one :chat, dependent: :destroy, class_name: "::Chat"
end
