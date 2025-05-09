class AddColumnsToCursos < ActiveRecord::Migration[8.0]
  def change
    change_table :cursos do |t|
      t.string :prova
      t.string :tipo
    end
  end
end
