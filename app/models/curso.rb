class Curso < ApplicationRecord
  attr_accessor :remove_imagem

  has_one_attached :imagem
  has_many :curso_words, class_name: "CursoWord"
  has_many :words, through: :curso_words
  has_many :modulos, class_name: "Modulo", inverse_of: :curso, dependent: :destroy
  has_many :aulas, through: :modulos
  has_many :user_cursos, dependent: :destroy
  has_many :users, through: :user_cursos
  has_many :cart_cursos

  accepts_nested_attributes_for :modulos, allow_destroy: true, reject_if: :titulo_blank?

  validates :name, presence: true

  scope :find_by_name, ->(term) {
    where("name ILIKE ?", "%#{term}%")
  }

  def add_word(word_id)
    curso_words.create(curso_id: id, word_id: word_id)
  end

  private

  def titulo_blank?(attributes)
    attributes["titulo"].blank?
  end
end
