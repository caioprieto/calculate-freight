class AddColumnsToUserCursos < ActiveRecord::Migration[8.0]
  def change
    change_table :user_cursos do |t|
      t.integer :total_aulas, default: 0
      t.integer :total_aulas_vistas, default: 0
    end
  end
end
