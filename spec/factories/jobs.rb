FactoryGirl.define do
  factory :job do
    sequence :title do |n|
      "Job #{n}"
    end

    description "Good Burger, Home of the Good Burger"

    sequence :level_of_interest do |n|
      n * 2
    end

    sequence :city do |n|
      "City #{n}"
    end

    company

  end
end
