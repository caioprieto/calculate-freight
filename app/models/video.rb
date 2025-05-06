class Video < ApplicationRecord
  has_one_attached :video

  validates :video, presence: true
end
