require 'spec_helper'

describe UsersController do

  describe "put user" do
    it "update grade should be successful" do
      senior_grade = FactoryGirl.create :senior_grade
      grade = FactoryGirl.create :primary_grade
      user = FactoryGirl.create :user, grade: grade
      put "/user", user: { name: "test", emial: "test@test.com", grade: senior_grade}, id: user.id
      p user
    end
  end

end
