class AddFieldsToCurso < ActiveRecord::Migration[8.0]
  def change
    change_table :cursos do |t|
      t.decimal :value
      t.integer :duration
    end
  end
end
