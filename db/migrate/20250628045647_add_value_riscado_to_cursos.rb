class AddValueRiscadoToCursos < ActiveRecord::Migration[8.0]
  def change
    change_table :cursos do |t|
      t.decimal :value_riscado
      t.integer :vigencia, null: false, default: 6
    end
  end
end
