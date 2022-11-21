class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :duration, presence: true
  validates :total_price, presence: true
end
