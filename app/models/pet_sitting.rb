class PetSitting < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :user, uniqueness: true
end
