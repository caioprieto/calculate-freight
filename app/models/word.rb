class Word < ApplicationRecord
  WORD_TYPES = %w[enem unicamp fuvest]

  has_many :texts, class_name: "Text", dependent: :destroy
end
