class AddIndexToReviews < ActiveRecord::Migration
  def up
    remove_index :reviews, :playlist_id
    add_index :reviews, [:playlist_id, :user_id], unique: true
  end
  def down
    remove_index :reviews, [:playlist_id, :user_id]
    add_index :reviews, :playlist_id
  end
end
