require 'spec_helper'
require "cancan/matchers"

describe "User" do
  describe "abilities" do
    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is an account admin" do
      let(:user){ FactoryGirl.create(:admin_user) }

      it{ should be_able_to(:manage, :all) }
    end

    context "when is an account normal user" do
      let(:user){ FactoryGirl.create(:user) }

      context Project do
        it{ should be_able_to(:create, Project) }
        it{ should be_able_to(:join, Project) }
        it{ should be_able_to(:quit, Project) }
        it{ should be_able_to(:finish, Project) }
        it{ should be_able_to(:update, (FactoryGirl.create :project, user: user)) }
      end
    end

    context "when is an guest" do
      let(:user){ User.new }
      it{ should be_able_to(:show, Badge) }
      it{ should be_able_to(:index, Badge) }
      it{ should_not be_able_to(:update, Badge)}
    end
  end
end
