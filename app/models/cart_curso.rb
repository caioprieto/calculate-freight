class CartCurso < ApplicationRecord
  belongs_to :cart
  belongs_to :curso

  validates :curso_id, uniqueness: { scope: :cart_id, message: "já está no carrinho" }
end
