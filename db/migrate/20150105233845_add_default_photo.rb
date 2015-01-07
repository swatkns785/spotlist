class AddDefaultPhoto < ActiveRecord::Migration
  def change
    change_column :users, :profile_photo, :string, null: false, default: 'app/assets/images/questionmark.jpg'
  end
end
