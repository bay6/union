require 'spec_helper'

describe BadgeUsers do

  context "class" do
    subject { BadgeUsers }
  end

  describe "validations" do
  	it { should validate_presence_of :badge_id}
  	it { should validate_presence_of :user_id}

  	context "uniqueness" do 
  	  it "should can not save when it exist user_id and badge_id" do 
  	  	exist_badge_user = FactoryGirl.create(:badge_users)
  	  	new_badge_user = BadgeUsers.create(:user_id => exist_badge_user.user_id, :badge_id => exist_badge_user.badge_id )
  	  	new_badge_user.errors.should_not be_empty
  	  end
  	end
  end
  
end
