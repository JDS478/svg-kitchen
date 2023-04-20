class FoodPlace < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
