class AddTypeToNotifications < ActiveRecord::Migration[8.0]
  def change
    change_table :notifications do |t|
      t.string :type, null: false
    end
  end
end
