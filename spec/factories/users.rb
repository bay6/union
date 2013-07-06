# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "admin"
    email "admin@example.com"
    password "12345678"
  end
end
