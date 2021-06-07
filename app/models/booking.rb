class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet_sitting
end
