class FoodPlace < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  has_many :food_place_reviews, dependent: :destroy
  has_many :reviews, through: :food_place_reviews

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
