class UserCurso < ApplicationRecord
  belongs_to :curso
  belongs_to :user

  validates :progresso, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  scope :ativos, -> { where("data_fim > ?", Time.zone.now).where(ativo: true) }
  scope :expirados, -> { where("data_fim <= ?", Time.zone.now).or(where(ativo: false)) }

  def expirado?
    return false if data_fim.blank?

    !ativo || data_fim <= Time.zone.now
  end

  def calculate_values
    return if curso.aulas.blank?

    calculate_total_aulas
    calculate_total_aulas_vistas
    calculate_progress
  end

  def calculate_total_aulas
    update(total_aulas: curso.aulas.count)
  end

  def calculate_total_aulas_vistas
    update(total_aulas_vistas: user.user_aulas.where(curso_id: curso.id, watched: true).count)
  end

  def calculate_progress
    update(progresso: (total_aulas_vistas.to_f / total_aulas.to_f) * 100)
  end
end
