# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    project nil
    user nil
    category "MyString"
  end
end
