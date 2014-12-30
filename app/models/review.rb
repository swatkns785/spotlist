class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :review

  validates :rating,
    presence: true

  validates :description,
    presence: true
end
