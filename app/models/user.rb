class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_one :cart, dependent: :destroy
  has_one_attached :imagem

  has_many :user_cursos, dependent: :destroy
  has_many :cursos, through: :user_cursos
  has_many :user_words, dependent: :destroy
  has_many :words, through: :user_words
  has_many :user_aulas, dependent: :destroy
  has_many :watched_aulas, through: :user_aulas, source: :aula
  has_many :pedidos, dependent: :destroy
  has_many :messages, as: :dono, class_name: "::Message"
  has_many :notifications, dependent: :destroy
  has_many :favoritos, dependent: :destroy

  validates :nome, :sobrenome, :cpf, presence: true
  validates :cpf, uniqueness: { case_sensitive: false }
  validates :cpf, format: { with: /\A\d{11}\z/, message: "deve conter 11 dígitos numéricos" }
  validate :cpf_must_be_valid

  def cpf_must_be_valid
    errors.add(:cpf, "não é válido") unless CPF.valid?(cpf)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    user ||= User.create(nome: data["name"],
                        email: data["email"],
                        password: Devise.friendly_token[0, 20])
    user
  end

  def set_admin
    update(admin: true)
  end

  def admin?
    return true if admin

    false
  end
end
