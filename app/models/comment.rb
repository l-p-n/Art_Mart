class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :user, :artwork, :body, presence: true
end
