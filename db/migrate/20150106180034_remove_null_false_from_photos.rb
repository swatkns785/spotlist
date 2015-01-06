class RemoveNullFalseFromPhotos < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo, :string, default: "http://sellleadsucceed.files.wordpress.com/2014/02/bigstock-silhouette-with-a-question-mar-59367497.jpg", null: false

    add_column :users, :profile_photo, :string, default: "http://sellleadsucceed.files.wordpress.com/2014/02/bigstock-silhouette-with-a-question-mar-59367497.jpg"
  end
end
