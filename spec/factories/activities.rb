# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    title "MyString"
    description "MyText"
    start_at "2013-07-21 11:37:18"
    summary "MyText"
  end
end
