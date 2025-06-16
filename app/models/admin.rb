class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :timeoutable

  has_many :messages, as: :dono, class_name: "::Message"
end
