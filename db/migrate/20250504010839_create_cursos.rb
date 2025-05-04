class CreateCursos < ActiveRecord::Migration[8.0]
  def change
    create_table :cursos do |t|
      t.string :name, null: false
      t.string :description
      t.string :subdescription

      t.boolean :active, default: false, null: false
      t.timestamps
    end
  end
end
