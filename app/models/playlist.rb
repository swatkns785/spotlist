class Playlist < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: true

  validates :url,
  presence: true

  validates :description,
  presence: true
end