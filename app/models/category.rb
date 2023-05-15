class Category < ApplicationRecord
  scoped_search on: [:name]

  validates :name, presence: true
  validates :order, numericality: { greater_than: 0 }, uniqueness: true
end
