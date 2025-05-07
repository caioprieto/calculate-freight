class Curso < ApplicationRecord
  has_many :modulos, class_name: "Modulo", inverse_of: :curso, dependent: :destroy

  accepts_nested_attributes_for :modulos, allow_destroy: true
end
