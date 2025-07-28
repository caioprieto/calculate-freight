class AddImageTypeToWords < ActiveRecord::Migration[8.0]
  def change
    change_table :words do |t|
      t.string :image_type, default: 'cover', null: false
    end
  end
end
