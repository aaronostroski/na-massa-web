FactoryBot.define do
  factory :order_info do
    order
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    cpf { FFaker::IdentificationBR.cpf }
    phone { "48991202323" }
    email { FFaker::Internet.email }
  end
end
