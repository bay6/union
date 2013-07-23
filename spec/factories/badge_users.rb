# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :badge_users do
    user_id 1
    badge_id 2
    content "MyText"
  end
end
