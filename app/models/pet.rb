class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  # validates :photo, presence: true

  def get_age
    return nil unless birthdate

    ((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor
  end
end
