class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title,
    presence: true

  validates :url,
    presence: true

  validates :description,
    presence: true,
    length: { minimum: 1, maximum: 300 }
end
