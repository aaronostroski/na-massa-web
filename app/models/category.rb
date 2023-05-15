class Category < ApplicationRecord
  validates :name, presence: true
  validates :order, numericality: { greater_than: 0 }, uniqueness: true
end
