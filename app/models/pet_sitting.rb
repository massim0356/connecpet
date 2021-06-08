class PetSitting < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :user, uniqueness: true
end
