class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.references :dono, polymorphic: true
      t.text :content
      t.timestamps
    end
  end
end
