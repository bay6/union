# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    website "MyString"
    description "MyText"
    grade nil
    user nil
    started_at "2013-06-26"
    finished_at "2013-06-26"
    status "MyString"
  end
end
