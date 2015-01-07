class User < ActiveRecord::Base
  has_many :playlists, dependent: :destroy
  has_many :reviews
  has_many :votes, through: :reviews


  mount_uploader :profile_photo, ProfilePhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def recent_reviews
    reviews.order(created_at: :desc)
  end
end
