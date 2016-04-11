FactoryGirl.define do
  factory :student do
    association :user
    name "Test Student"
    birthday 5.years.ago
  end
end
