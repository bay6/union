# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grade do
    name "MyString"
    description "MyText"
    weights 1
  end
end
