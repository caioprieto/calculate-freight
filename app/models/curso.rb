class Curso < ApplicationRecord
  attr_accessor :remove_imagem

  has_one_attached :imagem
  has_many :modulos, class_name: "Modulo", inverse_of: :curso, dependent: :destroy
  has_many :aulas, through: :modulos

  accepts_nested_attributes_for :modulos, allow_destroy: true, reject_if: :titulo_blank?

  validates :name, presence: true

  private

  def titulo_blank?(attributes)
    attributes["titulo"].blank?
  end
end
