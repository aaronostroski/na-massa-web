FactoryBot.define do
  factory :order do
    trait :requested do
      requested_at { Time.current }
    end

    trait :accepted do
      total { FFaker.numerify('##.##') }
      requested
      accepted_at { Time.current }
    end

    trait :finished do
      accepted
      finished_at { Time.current }
    end

    trait :delivered do
      finished
      delivered_at { Time.current }
    end

    trait :cancelled do
      requested
      cancelled_at { Time.current }
    end

    trait :with_products do
      products { [FactoryBot.create(:product)] }
    end
  end
end
