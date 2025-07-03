class Notification < ApplicationRecord
  TYPES = %w[add_word send_word add_curso]

  belongs_to :user

  validates :notification_type, inclusion: TYPES
end
