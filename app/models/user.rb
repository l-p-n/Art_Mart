class User < ApplicationRecord
  has_many :bookings
  has_many :artworks

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
