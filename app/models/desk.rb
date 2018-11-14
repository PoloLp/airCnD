class Desk < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader

  def desk_average_rating
    return self.bookings.average(:rating).round(1) unless self.bookings.average(:rating).nil?
  end
end
