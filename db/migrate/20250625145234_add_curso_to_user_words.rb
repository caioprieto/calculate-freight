class AddCursoToUserWords < ActiveRecord::Migration[8.0]
  def change
    change_table :user_words do |t|
      t.references :curso, foreign_key: true
    end
  end
end
