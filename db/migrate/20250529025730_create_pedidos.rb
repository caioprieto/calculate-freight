class CreatePedidos < ActiveRecord::Migration[8.0]
  def change
    create_table :pedidos do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status, null: false, default: "pending"
      t.integer :cursos_count
      t.decimal :total

      t.timestamps
    end
  end
end
