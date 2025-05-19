class CreateUserCursos < ActiveRecord::Migration[8.0]
  def change
    create_table :user_cursos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true
      t.integer :progresso, default: 0, null: false
      t.boolean :concluido, default: false, null: false
      t.datetime :data_inicio
    end

    add_index :user_cursos, [ :user_id, :curso_id ], unique: true
  end
end
