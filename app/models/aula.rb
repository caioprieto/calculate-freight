class Aula < ApplicationRecord
  belongs_to :modulo, class_name: "Modulo", inverse_of: :aulas
  has_one_attached :video
  validates :titulo, presence: true
end
