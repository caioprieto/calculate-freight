class CartCurso < ApplicationRecord
  belongs_to :cart
  belongs_to :curso

  validates :curso_id, uniqueness: { scope: :cart_id, message: "já está no carrinho" }
  validate :curso_comprado

  private

  def curso_comprado
    if cart.user.cursos.where(id: curso_id).present?
      errors.add(:base, "Curso já está adicionado na biblioteca")
    end
  end
end
