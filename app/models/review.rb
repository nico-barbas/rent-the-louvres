class Review < ApplicationRecord
  belongs_to :artwork
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "Please enter a rate between 0 and 5" }
end
