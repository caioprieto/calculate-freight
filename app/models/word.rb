class Word < ApplicationRecord
  WORD_TYPES = %w[enem unicamp fuvest]

  has_one_attached :imagem
  has_many :curso_words, class_name: "CursoWord"
  has_many :texts, class_name: "Text", dependent: :destroy
  has_and_belongs_to_many :cursos
end
