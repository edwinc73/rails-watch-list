class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
end
