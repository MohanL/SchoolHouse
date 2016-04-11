FactoryGirl.define do
  factory :user do
    email "test_user@example.com"
    password "password"
    password_confirmation "password"
    factory :admin do
      email "admin@example.com"
      role 1
    end
  end
end
