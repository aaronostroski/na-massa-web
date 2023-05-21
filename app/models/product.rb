class Product < ApplicationRecord
  has_one_attached :cover_image

  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products

  scoped_search on: %i[name description]

  validates :name,
            :description,
            :price,
            :cover_image,
            :category_ids,
            presence: true
  validates :price, numericality: { greater_than: 0 }

  scope :active, -> { where(is_active: true) }
  scope :highlighted, -> { where(is_highlight: true) }
end
