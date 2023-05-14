FactoryBot.define do
  factory :banner do
    title { FFaker::Book.title }
    sequence(:order) { |n| n }
    cover_image do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/support/banner.jpg'), 'image/jpg')
    end

    trait :active do
      is_active { true }
    end
  end
end
