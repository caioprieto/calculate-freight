class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status, default: "pending", null: false
      t.decimal :total

      t.timestamps
    end
  end
end
