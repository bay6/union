# coding: utf-8

FactoryGirl.define do
  factory :grade do
    name "MyString"
    description "MyText"
    weights 1
  end

  factory :primary_grade, class: "Grade" do
    name "初级"
    weights 1
  end

  factory :senior_grade, class: "Grade" do
    name "高级"
    weights 4
  end
end
