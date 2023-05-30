class Booking < ApplicationRecord
  belongs_to :boxer
  belongs_to :user
end
