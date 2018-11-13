class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :desk
  validates :price, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :start_at, presence: true
  validates :end_at, presence: true
end
