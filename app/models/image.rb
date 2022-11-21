class Image < ApplicationRecord
  belongs_to :artwork

  validates :url, presence: true
  validates :url, uniqueness: true
end
