class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :description
      t.integer :duration, null: false, default: 0

      t.timestamps
    end
  end
end
