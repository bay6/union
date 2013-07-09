# coding: utf-8

require 'spec_helper'

describe User do

  before :each do
    @primary_grade = FactoryGirl.create :primary_grade
    @senior_grade = FactoryGirl.create :senior_grade
    @user = FactoryGirl.create :user
  end
  
  it "should create user default grade with weights value is 1 " do
    expect(@user.grade.try(:weights)).to eq(1)
  end

  it "user with 初级 grade not add 高级 grade project " do
    project = FactoryGirl.create :project, grade_id: @senior_grade.id
    expect(@user.join_project project.id).to eq(false)
  end

  it "should be successfule when update user grade" do
    @user.update_attributes grade: @senior_grade
    expect(@user.grade).to eq(@senior_grade)
  end

  it "user with  高级 grade can add 初级 grade project" do
    @user.update_attributes grade: @senior_grade
    project = FactoryGirl.create :project, grade_id: @primary_grade.id
    expect(@user.join_project project.id).to eq(true)
  end

end
