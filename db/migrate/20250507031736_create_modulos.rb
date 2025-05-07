class CreateModulos < ActiveRecord::Migration[8.0]
  def change
    create_table :modulos do |t|
      t.belongs_to :curso, null: false, foreign_key: true
      t.string :titulo, null: false
      t.string :description
      t.integer :position
      t.integer :duration

      t.timestamps
    end
  end
end
