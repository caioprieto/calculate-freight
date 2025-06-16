class UserWord < ApplicationRecord
  belongs_to :word
  belongs_to :user

  has_one :chat, dependent: :destroy, class_name: "::Chat"
end
