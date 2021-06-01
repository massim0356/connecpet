class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_friendship
  has_many :pets
  has_many :petsittings
  has_many :bookings
  has_many :reviews
  has_many :bookings_as_owner, through: :petsittings, source: :bookings
  has_one_attached :photo

  def messages_with(friend)
    Message.where(sender: friend, receiver: self).or(Message.where(sender: self, receiver: friend))
  end
end
