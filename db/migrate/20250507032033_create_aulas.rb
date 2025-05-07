class CreateAulas < ActiveRecord::Migration[8.0]
  def change
    create_table :aulas do |t|
      t.belongs_to :modulo, null: false, foreign_key: true
      t.string :titulo, null: false
      t.string :description
      t.integer :duration
      t.integer :position

      t.timestamps
    end
  end
end
