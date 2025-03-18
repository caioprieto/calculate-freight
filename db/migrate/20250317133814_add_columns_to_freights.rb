class AddColumnsToFreights < ActiveRecord::Migration[8.0]
  def change
    change_table :freights do |t|
      t.references :address_origem, foreign_key: { to_table: :address }, null: false
      t.references :address_destino, foreign_key: { to_table: :address }, null: false
    end
  end
end
