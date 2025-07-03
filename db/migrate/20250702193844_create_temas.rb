class CreateTemas < ActiveRecord::Migration[8.0]
  def change
    create_table :temas do |t|
      t.string :name, null: false
      t.string :prova, null: false, default: 'enem'

      t.timestamps
    end
  end
end
