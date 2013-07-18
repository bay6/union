require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/messages").should route_to("messages#index")
    end

    it "routes to #destroy" do
      delete("/messages/1").should route_to("messages#destroy", :id => "1")
    end

  end
end
