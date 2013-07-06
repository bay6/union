# coding: utf-8

require 'spec_helper'

describe User do
  
  it "should create user not grade" do
    grade = FactoryGirl.create :primary_grade
    user = FactoryGirl.create :user
    expect(user.grade.try(:name)).to eq(nil)
  end

  it "user with 初级 grade not add 高级 grade project " do
    grade = FactoryGirl.create :primary_grade
    user = FactoryGirl.create :user
    senior_grade = FactoryGirl.create :senior_grade
    project = FactoryGirl.create :project, grade_id: senior_grade.id
    expect(user.join_project project.id).to eq(false)
  end

  it "user with  高级 grade can add 初级 grade project" do
    grade = FactoryGirl.create :primary_grade
    senior_grade = FactoryGirl.create :senior_grade
    user = FactoryGirl.create :user, grade_id: senior_grade.id
    project = FactoryGirl.create :project, grade_id: grade.id
    expect(user.join_project project.id).to eq(true)
  end

end
