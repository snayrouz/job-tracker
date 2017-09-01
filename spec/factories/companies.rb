FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "Turing #{n}"
    end
  end

  trait :with_jobs do
    transient do
      job_count 3
    end
  end
end
