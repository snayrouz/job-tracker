FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "Web Development #{n}"
    end
  end
end
