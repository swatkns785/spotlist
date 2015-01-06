class AddDefaultPhotoReal < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo, :string, null: false, default: 'app/assets/images/questionmark.jpg'

    add_column :users, :profile_photo, :string
  end
end
