# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participation do
    project_id
    user_id
    role "MyString"
  end
end
