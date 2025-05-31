class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_cursos
  has_many :cursos, through: :cart_cursos

  has_many :pedidos

  def total
    cursos.sum(:value)
  end

  def clear_data
    cart_cursos.destroy_all
  end
end
