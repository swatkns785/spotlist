class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist

  validates :rating,
    presence: true

  validates :description,
    presence: true
end
