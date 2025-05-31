module StateMachines
  module PedidoState
    extend ActiveSupport::Concern

    included do
      state_machine :status, initial: :pending do
        state :pending
        state :confirmado
        state :finalizado

        event :confirmar do
          transition pending: :confirmado
        end

        event :finalizar do
          transition confirmado: :finalizado
        end

        after_transition to: :confirmado do |pedido|
          pedido.liberar_curso
          pedido.finalizar
        end

        after_transition to: :finalizado do |pedido|
          pedido.cart.clear_data
        end
      end
    end
  end
end
