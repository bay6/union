# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    project_id
    user_id
    category "MyString"
  end
end
