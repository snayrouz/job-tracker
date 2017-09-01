FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "Web Development #{n}"
    end

    trait :with_jobs do
      transient do
        job_count 3
      end
    end

  end

end
