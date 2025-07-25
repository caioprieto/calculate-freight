class Tema < ApplicationRecord
  has_one_attached :pdf_file
  has_one_attached :capa

  scope :find_by_prova, ->(prova) {
    where(prova: prova)
  }
end
