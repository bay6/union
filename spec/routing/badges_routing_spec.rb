require "spec_helper"

describe BadgesController do
  describe "routing" do

    it "routes to #index" do
      get("/badges").should route_to("badges#index")
    end

    it "routes to #new" do
      get("/badges/new").should route_to("badges#new")
    end

    it "routes to #show" do
      get("/badges/name").should route_to("badges#show", :name_en => "name")
    end

    it "routes to #edit" do
      get("/badges/1/edit").should route_to("badges#edit", :id => "1")
    end

    it "routes to #create" do
      post("/badges").should route_to("badges#create")
    end

    it "routes to #update" do
      put("/badges/1").should route_to("badges#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/badges/1").should route_to("badges#destroy", :id => "1")
    end

  end
end
