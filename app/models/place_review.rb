class PlaceReview < ApplicationRecord
  belongs_to :user
  belongs_to :food_place

  validates :title, presence: true
end
