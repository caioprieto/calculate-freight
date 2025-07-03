class Tema < ApplicationRecord
  has_one_attached :pdf_file
  has_one_attached :capa
end
