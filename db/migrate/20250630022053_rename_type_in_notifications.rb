class RenameTypeInNotifications < ActiveRecord::Migration[8.0]
  def change
    rename_column :notifications, :type, :notification_type
  end
end
