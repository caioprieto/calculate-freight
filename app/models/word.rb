class Word < ApplicationRecord
  WORD_TYPES = %w[enem unicamp usp unesp]

  has_one :aula, class_name: "::Aula", dependent: :nullify
  has_one_attached :imagem
  has_one_attached :pdf_file

  has_many :curso_words, class_name: "CursoWord", dependent: :destroy
  has_many :texts, class_name: "Text", dependent: :destroy
  has_and_belongs_to_many :cursos

  has_many :user_words, dependent: :destroy
  has_many :users, through: :user_words
end
