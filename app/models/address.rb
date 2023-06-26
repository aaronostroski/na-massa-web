class Address < ApplicationRecord
  validates :number,
            :complement,
            :zipcode,
            :city,
            :street,
            :neighborhood,
            presence: true

  validates :number, numericality: { greater_than: 0 }
  validates :zipcode, format: { with: /\A\d{8}\z/ }

  before_validation { self.zipcode = strip_mask(self.zipcode) }

  private

  def strip_mask(value)
    value&.gsub(/[^0-9]/, '')
  end
end
