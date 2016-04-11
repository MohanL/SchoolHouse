FactoryGirl.define do
  factory :student_class do
    name "Test Class"
    min_age 3
    max_age 5
    start_date Time.now
    end_date 4.months.from_now
    start_time Time.now
    end_time 3.hours.from_now
    meets_on ['Mondays', 'Wednesdays', 'Fridays']
  end
end
