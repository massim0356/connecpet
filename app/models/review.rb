class Review < ApplicationRecord
  belongs_to :user
  belongs_to :petsitting
end
