class Favorito < ApplicationRecord
  belongs_to :user, class_name: "::User"
  belongs_to :tema, class_name: "::Tema"

  validates :tema_id, uniqueness: { scope: :user_id, message: "já foi adicionado aos favoritos" }
end
