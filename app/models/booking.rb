class Booking < ApplicationRecord
  belongs_to :boxer
  belongs_to :user

  validates :status, inclusion: { in: ["pending", "validated", "refused"] }
end
