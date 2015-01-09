class Playlist < ActiveRecord::Base
  paginates_per 8
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title,
    presence: true

  validates :url,
    presence: true,
    format: { with: URI::regexp("spotify:user"), message: "Please use the valid Spotify URI address." }

  validates :description,
    presence: true,
    length: { minimum: 1, maximum: 300 }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%" + query + "%", "%" + query + "%")
  end
end
