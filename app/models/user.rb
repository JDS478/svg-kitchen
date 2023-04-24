class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :photo

  has_many :comments

  has_many :posts, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :messages, dependent: :destroy
end
