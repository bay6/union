require "spec_helper"

describe CommitsController do
  describe "routing" do

    it "routes to #index" do
      get("/commits").should route_to("commits#index")
    end

    it "routes to #new" do
      get("/commits/new").should route_to("commits#new")
    end

    it "routes to #show" do
      get("/commits/1").should route_to("commits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/commits/1/edit").should route_to("commits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/commits").should route_to("commits#create")
    end

    it "routes to #update" do
      put("/commits/1").should route_to("commits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/commits/1").should route_to("commits#destroy", :id => "1")
    end

  end
end
