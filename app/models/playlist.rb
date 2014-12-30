class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :title,
    presence: true

  validates :url,
    presence: true

  validates :description,
    presence: true
end
