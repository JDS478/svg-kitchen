class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :photo

  has_many :reviews, dependent: :destroy
end
