FactoryGirl.define do
  factory :supply do
    association :student_class
    name "MyString"
    date_due Time.now
    amount "100"

    after(:build) do |supply|
      student_class = FactoryGirl.build(:student_class)
      student_class.supplies << supply
    end
  end
end
