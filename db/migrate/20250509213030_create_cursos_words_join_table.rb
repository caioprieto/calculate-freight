class CreateCursosWordsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :cursos, :words do |t|
      t.index :curso_id
      t.index :word_id
    end
  end
end
