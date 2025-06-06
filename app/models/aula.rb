class Aula < ApplicationRecord
  belongs_to :modulo, class_name: "::Modulo", inverse_of: :aulas
  belongs_to :word, class_name: "::Word", optional: true

  has_one_attached :video

  has_many :user_aulas, dependent: :destroy
  has_many :users, through: :user_aulas

  validates :titulo, presence: true
end
