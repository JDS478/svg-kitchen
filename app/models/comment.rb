class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
end
