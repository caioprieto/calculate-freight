class AddCursosIdsToPedidos < ActiveRecord::Migration[8.0]
  def change
    change_table :pedidos do |t|
      t.integer :cursos_ids, array: true, default: [], null: false
    end
  end
end
