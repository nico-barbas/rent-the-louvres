class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :start_date, presence: true, uniqueness: { scope: :end_date }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :duration, presence: true
  validates :total_price, presence: true
end
