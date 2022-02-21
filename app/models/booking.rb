class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :start_date, :end_date, :user_id, :artwork_id, presence: true
end
