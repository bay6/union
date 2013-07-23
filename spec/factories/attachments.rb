# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    file_name "MyString"
    content_type "MyString"
    file_size "MyString"
    attachmentable_type "MyString"
    attachment_id 1
  end
end
