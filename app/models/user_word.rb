class UserWord < ApplicationRecord
  belongs_to :word
  belongs_to :user
  belongs_to :curso

  has_one :chat, dependent: :destroy, class_name: "::Chat"
end
