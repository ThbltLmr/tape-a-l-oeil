class Booking < ApplicationRecord
  belongs_to :boxer
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :status, inclusion: { in: ["pending", "validated", "refused", "done"] }
end
