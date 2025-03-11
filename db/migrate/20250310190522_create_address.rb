class CreateAddress < ActiveRecord::Migration[8.0]
  def change
    create_table :address do |t|
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :pais
      t.integer :numero
      t.integer :cep

      t.timestamps
    end
  end
end
