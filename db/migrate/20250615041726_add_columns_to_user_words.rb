class AddColumnsToUserWords < ActiveRecord::Migration[8.0]
  def change
    change_table :user_words do |t|
      t.boolean :concluido, default: false
      t.datetime :data_conclusao
    end
  end
end
