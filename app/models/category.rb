class Category < ApplicationRecord
  # belongs_to :recipe
  has_many :recipes
  has_one :photo
end
