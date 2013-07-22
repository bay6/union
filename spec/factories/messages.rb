# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    notice_id
    user_id
    status "MyString"
  end
end
