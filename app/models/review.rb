class Review < ActiveRecord::Base
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
