class CreateTexts < ActiveRecord::Migration[8.0]
  def change
    create_table :texts do |t|
      t.belongs_to :word, null: false, foreign_key: true
      t.text :content
    end
  end
end
