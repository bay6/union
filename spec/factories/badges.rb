# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :badge do
    name_zh "MyString"
    name_en "MyString"
    award_number 0
    description "MyText"
  end
end
