class Pet < ApplicationRecord
  belongs_to :user
  has_many :announcements
  has_one_attached :photo
end
