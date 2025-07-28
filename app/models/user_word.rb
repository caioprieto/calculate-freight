class UserWord < ApplicationRecord
  include StateMachines::UserWordState

  belongs_to :word
  belongs_to :user
  belongs_to :curso, optional: true

  has_one_attached :user_redacao
  has_one_attached :correcao

  has_one :chat, dependent: :destroy, class_name: "::Chat"

  scope :concluidas, -> { where(concluido: true) }
  scope :por_aluno, ->(nome) { joins(:user).where("users.nome ILIKE ?", "%#{nome}%") }
  scope :por_prova, ->(prova) { joins(:word).where(words: { word_type: prova }) }
  scope :ordenado_por_apertados, -> { order(data_conclusao: :asc) }
  scope :ordenado_por_melhores, -> { order(data_conclusao: :desc) }

  scope :por_periodo, ->(inicio, fim) {
    if inicio && fim
      where(data_conclusao: inicio.beginning_of_day..fim.end_of_day)
    elsif inicio
      where("data_conclusao >= ?", inicio.beginning_of_day)
    elsif fim
      where("data_conclusao <= ?", fim.end_of_day)
    end
  }

  def prazo_entrega
    return Time.zone.now if data_conclusao.blank?

    data_conclusao + 14.days
  end

  def user_redacao?
    user_redacao.attached?
  end

  def corrigido?
    correcao.attached?
  end
end
