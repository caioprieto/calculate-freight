class UserCurso < ApplicationRecord
  belongs_to :curso
  belongs_to :user

  validates :progresso, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def recalculate_progress
    progress = user.progress(curso)

    update(progresso: progress)
  end
end
