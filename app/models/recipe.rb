class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo

  has_many :reviews, dependent: :destroy
end
