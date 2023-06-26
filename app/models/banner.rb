class Banner < ApplicationRecord
  has_one_attached :cover_image

  scoped_search on: [:title]

  validates :title, :cover_image, presence: true
  validates :order, numericality: { greater_than: 0 }, uniqueness: true

  scope :active, -> { where(is_active: true) }
end
