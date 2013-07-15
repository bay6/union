# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    notice nil
    user nil
    status "MyString"
  end
end
