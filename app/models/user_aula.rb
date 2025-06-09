class UserAula < ApplicationRecord
  belongs_to :user
  belongs_to :aula
  belongs_to :curso

  validates :user_id, uniqueness: { scope: :aula_id }
end
