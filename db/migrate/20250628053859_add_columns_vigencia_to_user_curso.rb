class AddColumnsVigenciaToUserCurso < ActiveRecord::Migration[8.0]
  def change
    add_column :user_cursos, :data_fim, :datetime
    add_column :user_cursos, :ativo, :boolean, default: true
  end
end
