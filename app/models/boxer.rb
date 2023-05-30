class Boxer < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
