class Product < ApplicationRecord
  has_one_attached :cover_image

  scoped_search on: %i[name description]

  validates :name, :description, :price, :cover_image, presence: true
  validates :price, numericality: { greater_than: 0 }
end
