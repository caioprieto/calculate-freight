class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_cursos
  has_many :cursos, through: :cart_cursos
end
