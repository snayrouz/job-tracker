FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "Turing #{n}"
    end
  end
end
