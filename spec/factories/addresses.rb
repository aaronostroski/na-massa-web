FactoryBot.define do
  factory :address do
    street { FFaker::AddressBR.street }
    complement { FFaker::AddressBR.street_name }
    reference { FFaker::AddressBR.street_suffix }
    number { FFaker::AddressBR.building_number }
    neighborhood { FFaker::AddressBR.neighborhood }
    zipcode { FFaker::AddressBR.zip_code }
    city { FFaker::AddressBR.city }
  end
end
