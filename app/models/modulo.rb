class Modulo < ApplicationRecord
  belongs_to :curso, class_name: "Curso", inverse_of: :modulos

  has_many :aulas, inverse_of: :modulo, dependent: :destroy

  accepts_nested_attributes_for :aulas, allow_destroy: true
end
