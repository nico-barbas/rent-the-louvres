class Artwork < ApplicationRecord
  belongs_to :user
  has_many :images

  validates :title, presence: true
  validates :title, uniqueness: true

  validates :description, presence: true
  validates :description, length: { minimum: 20, maximum: 512 }

  validates :price_per_day, presence: true
end
