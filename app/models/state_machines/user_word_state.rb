module StateMachines
  module UserWordState
    extend ActiveSupport::Concern

    included do
      state_machine :status, initial: :pending do
        state :pending
        state :enviado_correcao
        state :corrigido

        event :enviar do
          transition pending: :enviado_correcao, if: :user_redacao?
        end

        event :finalizar do
          transition enviado_correcao: :corrigido, if: :corrigido?
        end
      end
    end
  end
end
