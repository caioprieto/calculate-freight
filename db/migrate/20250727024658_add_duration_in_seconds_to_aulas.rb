class AddDurationInSecondsToAulas < ActiveRecord::Migration[8.0]
  def change
    add_column :aulas, :duration_in_seconds, :integer
  end
end
