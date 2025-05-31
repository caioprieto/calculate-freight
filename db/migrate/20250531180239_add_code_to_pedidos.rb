class AddCodeToPedidos < ActiveRecord::Migration[8.0]
  def change
    change_table :pedidos do |t|
      t.string :code
    end
  end
end
