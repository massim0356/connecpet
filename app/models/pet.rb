class Pet < ApplicationRecord
  belongs_to :user
  has_many :announcements
  has_one_attached :photo

  def get_age
    ((Time.zone.now - self.birthdate.to_time) / 1.year.seconds).floor
  end
end
