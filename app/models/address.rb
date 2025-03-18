class Address < ApplicationRecord
  self.table_name = :address

  has_many :freights
end
