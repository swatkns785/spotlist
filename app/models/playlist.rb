class Playlist < ActiveRecord::Base
  paginates_per 3
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title,
    presence: true

  validates :url,
    presence: true,
    format: { with: URI.regexp}

  validates :description,
    presence: true,
    length: { minimum: 1, maximum: 300 }

  def self.search(query)
    where("plainto_tsquery(?) @@ " +
    "to_tsvector('english', title || ' ' || description)",
    query)
  end
end
