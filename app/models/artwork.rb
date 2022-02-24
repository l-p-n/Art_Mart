class Artwork < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :bookings

  validates :title, :artist, :user_id, presence: true
  validates :price_per_day, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }
  validates :date, length: { is: 4 }

  include PgSearch::Model
  pg_search_scope :search_by_title_artist_and_style,
    against: [ :title, :artist, :style ],
    using: {
      tsearch: { prefix: true }
    }
end
