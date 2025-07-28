module StateMachines
  module UserWordState
    extend ActiveSupport::Concern

    included do
      state_machine :status, initial: :pending do
        state :pending
        state :enviado
        state :corrigido

        event :enviar do
          transition pending: :enviado, if: :user_redacao?
        end

        event :finalizar do
          transition enviado: :corrigido, if: :corrigido?
        end
      end
    end
  end
end
