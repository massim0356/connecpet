class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_friendship
  has_many :pets, dependent: :destroy
  has_many :petsittings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings_as_owner, through: :petsittings, source: :bookings
  has_one_attached :photo, dependent: :destroy
  before_destroy :destroy_messages

  validates :photo, presence: true

  def messages_with(friend)
    Message.where(sender: friend, receiver: self).or(Message.where(sender: self, receiver: friend))
  end

  def destroy_messages
    messages.destroy_all
  end

  def messages
    Message.where(receiver: self).or(Message.where(sender: self))
  end
end
