class Pedido < ApplicationRecord
  include StateMachines::PedidoState

  belongs_to :cart, class_name: "::Cart"
  belongs_to :user, class_name: "::User"

  before_validation :set_code, on: :create

  validate :value_total, if: -> { cart.total != total }

  after_save :confirmar_pedido

  attr_readonly :cart_id, :user_id

  def liberar_curso
    cart.cursos.each do |curso|
      UserCurso.create(user_id: user_id, curso_id: curso.id, data_inicio: Time.zone.now)
    end
  end

  def confirmar_pedido
    confirmar
  end

  def set_code
    loop do
      self.code = SecureRandom.alphanumeric(8).upcase
      break unless Pedido.exists?(code: code)
    end
  end

  private

  def value_total
    errors.add(:base, "Valores foram adulterados, porém já foram concertados")
    update(total: cart.total)
  end
end
