FactoryBot.define do
  factory :admin do
    name { 'Admin' }
    sequence(:email) { |n| "#{n}_#{FFaker::Internet.email}" }
    password { '123456' }

    trait :active do
      is_active { true }
    end
  end
end
