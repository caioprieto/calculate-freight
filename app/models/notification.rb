class Notification < ApplicationRecord
  TYPES = %w[add_word send_word add_curso message]
  PAINELS = %w[user admin]

  belongs_to :user, class_name: "::User"
  belongs_to :chat, class_name: "::Chat", optional: true

  validates :notification_type, inclusion: TYPES
  validates :painel, inclusion: PAINELS
end
