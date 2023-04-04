class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :title, presence: true
  validates :content, presence: true
end
