class AddCursoToUserAulas < ActiveRecord::Migration[8.0]
  def change
    change_table :user_aulas do |t|
      t.references :curso, null: false, foreign_key: true
    end
  end
end
