class Review < ActiveRecord::Base
  paginates_per 2

  belongs_to :user
  belongs_to :playlist
  has_many :votes

  validates :rating,
    presence: true

  validates :description,
    presence: true,
    length:  { minimum: 25 }

  def total_score
    votes.sum(:entry)
  end
end
