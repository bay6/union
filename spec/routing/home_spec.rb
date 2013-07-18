require 'spec_helper'

describe HomeController do
  describe "route #index" do

    it "should route to union report page" do
      get("/union_report").should route_to('home#union_report')
    end

    it "should route to instructin page" do
      get('/instruction').should route_to('home#instruction')
    end

    it "should route to home index page" do
      get('/home/index').should route_to('home#index')
    end

  end
end
