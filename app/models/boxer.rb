class Boxer < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :bookings, source: :bookings
  has_many :bookings_as_renter, through: :bookings, source: :bookings
  has_one_attached :photo
end
