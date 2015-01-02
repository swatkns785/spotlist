class Vote < ActiveRecord::Base
  validates_uniqueness_of :entry,  scope: [:user_id, :review_id ]

  belongs_to :user
  belongs_to :review
end
