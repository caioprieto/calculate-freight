class Aula < ApplicationRecord
  belongs_to :modulo, class_name: "Modulo", inverse_of: :aulas

  has_one_attached :video

  has_many :user_aulas
  has_many :users, through: :user_aulas

  validates :titulo, presence: true
end
