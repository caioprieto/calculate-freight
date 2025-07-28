class AddColumnsToNotifications < ActiveRecord::Migration[8.0]
  def change
    change_table :notifications do |t|
      t.references :chat, foreign_key: true
      t.string :painel, default: "user", null: false
    end
  end
end
