class Artwork < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :reviews

  validates :title, presence: true, uniqueness: { scope: :creator }

  validates :description, presence: true
  validates :description, length: { minimum: 20 }

  validates :price_per_day, presence: true
end
