require "spec_helper"

describe GradesController do
  describe "routing" do

    it "routes to #index" do
      get("/grades").should route_to("grades#index")
    end

    it "routes to #new" do
      get("/grades/new").should route_to("grades#new")
    end

    it "routes to #show" do
      get("/grades/1").should route_to("grades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/grades/1/edit").should route_to("grades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/grades").should route_to("grades#create")
    end

    it "routes to #update" do
      put("/grades/1").should route_to("grades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/grades/1").should route_to("grades#destroy", :id => "1")
    end

  end
end
