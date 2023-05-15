FactoryBot.define do
  factory :category do
    name { FFaker::Book.title }
    is_active { false }
    sequence(:order) { |n| n }

    trait :active do
      is_active { true }
    end
  end
end
