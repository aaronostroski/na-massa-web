class Category < ApplicationRecord
  scoped_search on: [:name]

  has_one_attached :cover_image

  validates :name, :cover_image, presence: true
  validates :order, numericality: { greater_than: 0 }, uniqueness: true

  scope :active, -> { where(is_active: true) }
end
