FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.paragraph }
    price { FFaker.numerify('#.##') }
    cover_image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/support/hamburger.png'),
        'image/png',
      )
    end
    category_ids do
      [FactoryBot.create(:category).id, FactoryBot.create(:category).id]
    end

    trait :active do
      is_active { true }
    end
  end
end
