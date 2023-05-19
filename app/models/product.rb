class Product < ApplicationRecord
  has_one_attached :cover_image

  validates :name, :description, :price, :cover_image, presence: true
end
