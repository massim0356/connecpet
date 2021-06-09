class PetSitting < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :user, uniqueness: true
end
