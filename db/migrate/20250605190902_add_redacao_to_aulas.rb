class AddRedacaoToAulas < ActiveRecord::Migration[8.0]
  def change
    add_reference :aulas, :word, foreign_key: true
  end
end
