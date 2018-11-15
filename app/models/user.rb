class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :desks
  has_many :bookings

  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def list_desks
    Desk.all.select { |desk| desk.user == self }
  end

  def list_bookings
    Booking.all.select { |booking| booking.user == self }
  end
end
