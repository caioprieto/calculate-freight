class AddUniqueIndexToFavorites < ActiveRecord::Migration[8.0]
  def change
    add_index :favoritos, [ :user_id, :tema_id ], unique: true
  end
end
