class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_many :user_cursos, dependent: :destroy
  has_many :cursos, through: :user_cursos

  has_many :user_aulas
  has_many :watched_aulas, through: :user_aulas, source: :aula

  has_one :cart

  validates :nome, :sobrenome, :cpf, presence: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    user ||= User.create(name: data["name"],
                        email: data["email"],
                        password: Devise.friendly_token[0, 20])
    user
  end

  def set_admin
    update(admin: true)
  end

  def last_curso
    return if user_aulas.blank?

    user_aulas.order(:updated_at).last.aula.modulo.curso
  end

  def progress(curso)
    return if curso.blank?

    total_aulas = curso.modulos.includes(:aulas).flat_map(&:aulas)

    return 0 if total_aulas.empty?

    aulas_vistas = user_aulas.where(aula_id: total_aulas.map(&:id), watched: true)

    ((aulas_vistas.count.to_f / total_aulas.count) * 100).to_i
  end
end
