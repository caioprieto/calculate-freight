class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.references :user_word, foreign_key: true, null: true
      t.timestamps
    end
  end
end
