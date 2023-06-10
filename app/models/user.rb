class User < ApplicationRecord
  validates :username, :bio, presence: true
  validates :username, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :lists,through: :bookmarks, dependent: :destroy
end
