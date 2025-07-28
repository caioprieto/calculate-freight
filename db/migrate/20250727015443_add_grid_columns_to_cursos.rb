class AddGridColumnsToCursos < ActiveRecord::Migration[8.0]
  def change
    add_column :cursos, :grid_horas_video, :boolean, default: true, null: false
    add_column :cursos, :grid_mobile_and_tv, :boolean, default: true, null: false
    add_column :cursos, :grid_certificate, :boolean, default: true, null: false
    add_column :cursos, :grid_counter_words, :boolean, default: true, null: false
    add_column :cursos, :grid_correcoes, :boolean, default: true, null: false
  end
end
