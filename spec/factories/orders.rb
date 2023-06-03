FactoryBot.define do
  factory :order do
    sgid

    trait :with_user do
      user
    end

    trait :with_anonymous do
      sgid { self.to_sgid.to_s }
    end

    trait :requested do
      with_anonymous
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

    trait :develired do
      finished
      develired_at { Time.current }
    end

    trait :cancelled do
      requested
      cancelled_at { Time.current }
    end
  end
end
