class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
