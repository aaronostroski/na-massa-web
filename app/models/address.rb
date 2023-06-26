class Address < ApplicationRecord
  validates :number,
            :complement,
            :zipcode,
            :city,
            :street,
            :neighborhood,
            presence: true
end
