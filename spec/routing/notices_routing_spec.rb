require "spec_helper"

describe NoticesController do
  describe "routing" do

    it "routes to #index" do
      get("/notices").should route_to("notices#index")
    end

    it "routes to #new" do
      get("/notices/new").should route_to("notices#new")
    end

    it "routes to #show" do
      get("/notices/1").should route_to("notices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/notices/1/edit").should route_to("notices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/notices").should route_to("notices#create")
    end

    it "routes to #update" do
      put("/notices/1").should route_to("notices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/notices/1").should route_to("notices#destroy", :id => "1")
    end

  end
end
