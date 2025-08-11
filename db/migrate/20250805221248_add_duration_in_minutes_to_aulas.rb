class AddDurationInMinutesToAulas < ActiveRecord::Migration[8.0]
  def change
    add_column :aulas, :duration_in_minutes, :integer
  end
end
