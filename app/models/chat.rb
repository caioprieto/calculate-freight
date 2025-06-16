class Chat < ApplicationRecord
  belongs_to :user_word
  has_many :messages, dependent: :destroy, class_name: "::Message"
end
