class Announcement < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :registrations
  has_many :users, through: :registrations
end
