class AddCorrigidoToUserWords < ActiveRecord::Migration[8.0]
  def change
    change_table :user_words do |t|
      t.boolean :corrigido, default: false, null: false
    end
  end
end
