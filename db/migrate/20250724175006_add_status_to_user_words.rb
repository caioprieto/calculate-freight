class AddStatusToUserWords < ActiveRecord::Migration[8.0]
  def change
    change_table :user_words do |t|
      t.string :status, default: 'pending', null: false
    end
  end
end
