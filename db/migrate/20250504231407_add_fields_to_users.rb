class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users do |t|
      t.string :nome, null: false
      t.string :sobrenome, null: false
      t.integer :cpf, null: false
    end
  end
end
