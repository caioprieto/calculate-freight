class CreateWords < ActiveRecord::Migration[8.0]
  def change
    create_table :words do |t|
      t.string :word_type, null: false
      t.text :tema, null: false
      t.text :introducao
      t.text :proposta

      t.timestamps
    end
  end
end
