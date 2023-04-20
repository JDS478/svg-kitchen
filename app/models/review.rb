class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :food_place_reviews, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
