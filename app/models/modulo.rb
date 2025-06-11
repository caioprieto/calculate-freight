class Modulo < ApplicationRecord
  delegate :id, to: :curso, prefix: true, allow_nil: true

  belongs_to :curso, class_name: "Curso", inverse_of: :modulos
  has_many :aulas, inverse_of: :modulo, dependent: :destroy

  accepts_nested_attributes_for :aulas, allow_destroy: true
  validates :titulo, presence: true
end
