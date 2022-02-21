class Artwork < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :artist, :user_id, presence: true
  validates :price_per_day, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }
end
