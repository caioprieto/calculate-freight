class CreateCartCursos < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_cursos do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
