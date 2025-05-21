class CreateUserAula < ActiveRecord::Migration[8.0]
  def change
    create_table :user_aulas do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :aula, null: false, foreign_key: true
      t.boolean :watched, null: false

      t.timestamps
    end
  end
end
