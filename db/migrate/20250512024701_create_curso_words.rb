class CreateCursoWords < ActiveRecord::Migration[8.0]
  def change
    create_table :curso_words do |t|
      t.belongs_to :curso, null: false, foreign_key: true
      t.belongs_to :word, null: false, foreign_key: true
    end
  end
end
