class Desk < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
