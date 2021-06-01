class Pet < ApplicationRecord
  belongs_to :user
  has_many :announcements
  has_one_attached :photo

  def get_age
    Date.today - @pet.birthdate
  end
end
