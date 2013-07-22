# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notice do
    title "MyString"
    content "MyText"
    user_id
  end
end
