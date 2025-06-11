class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_one :cart
  has_one_attached :imagem

  has_many :user_cursos, dependent: :destroy
  has_many :cursos, through: :user_cursos

  has_many :user_words, dependent: :destroy
  has_many :words, through: :user_words

  has_many :user_aulas, dependent: :destroy
  has_many :watched_aulas, through: :user_aulas, source: :aula

  has_many :pedidos

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
end
