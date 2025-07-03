class Pedido < ApplicationRecord
  include StateMachines::PedidoState

  belongs_to :cart, class_name: "::Cart"
  belongs_to :user, class_name: "::User"

  before_validation :set_code, on: :create
  before_validation :set_cursos_ids, on: :create

  validate :value_total, if: -> { cart.total != total }

  after_save :confirmar_pedido

  attr_readonly :cart_id, :user_id

  scope :find_by_code, ->(code) {
    where("code ILIKE ?", "%#{code}%")
  }

  def liberar_cursos_redacoes
    cart.cursos.each do |curso|
      UserCurso.create(user_id: user_id, curso_id: curso.id, data_inicio: Time.zone.now, data_fim: Time.zone.now + curso.vigencia.months)
      Notification.create(user_id: user_id, title: "Novo curso disponível!", body: "#{curso.name.upcase} já está liberado na área do aluno", notification_type: "add_curso")

      curso.words.each do |word|
        UserWord.create(user_id: user_id, word_id: word.id, curso_id: curso.id)
        Notification.create(user_id: user_id, title: "Nova redação disponível!", body: "#{word.tema.upcase} já está liberado na área do aluno", notification_type: "add_word")
      end
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

  def set_cursos_ids
    self.cursos_ids = cart.cursos.pluck(:id)
  end

  private

  def value_total
    errors.add(:base, "Valores foram adulterados, porém já foram concertados")
    update(total: cart.total)
  end
end
