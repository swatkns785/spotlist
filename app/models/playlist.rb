class Playlist < ActiveRecord::Base

  VALID_SPOTIFY_URI = /spotify:user:[A-Z0-9._%+-]+:playlist:[A-Z0-9._%+-]+/i
  paginates_per 8
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title,
    presence: true

  validates :url,
    presence: true


  validates :url,
    format: { with: VALID_SPOTIFY_URI, message: "Please use the valid Spotify URI address."}

  validates :description,
    presence: true,
    length: { minimum: 1, maximum: 300 }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%" + query + "%", "%" + query + "%")
  end
end
