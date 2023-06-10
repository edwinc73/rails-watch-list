class User < ApplicationRecord
  validates :username, :bio, presence: true
  validates :username, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_one_attached :profile_picture
end
