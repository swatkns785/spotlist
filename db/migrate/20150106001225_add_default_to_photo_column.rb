class AddDefaultToPhotoColumn < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo, :string

    add_column :users, :profile_photo, :string, null: false, default: "http://sellleadsucceed.files.wordpress.com/2014/02/bigstock-silhouette-with-a-question-mar-59367497.jpg"
  end
end
