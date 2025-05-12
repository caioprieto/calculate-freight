class Word < ApplicationRecord
  WORD_TYPES = %w[enem unicamp fuvest]

  has_many :texts, class_name: "Text", dependent: :destroy
  has_and_belongs_to_many :cursos
end
