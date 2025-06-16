class Message < ApplicationRecord
  belongs_to :chat, class_name: "::Chat"
  belongs_to :dono, polymorphic: true
end
