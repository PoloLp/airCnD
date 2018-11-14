class Desk < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def desk_average_rating
    return self.bookings.average(:rating).round(1) unless self.bookings.average(:rating).nil?
  end
end
