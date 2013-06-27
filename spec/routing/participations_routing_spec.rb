require "spec_helper"

describe ParticipationsController do
  describe "routing" do

    it "routes to #index" do
      get("/participations").should route_to("participations#index")
    end

    it "routes to #new" do
      get("/participations/new").should route_to("participations#new")
    end

    it "routes to #show" do
      get("/participations/1").should route_to("participations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/participations/1/edit").should route_to("participations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/participations").should route_to("participations#create")
    end

    it "routes to #update" do
      put("/participations/1").should route_to("participations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/participations/1").should route_to("participations#destroy", :id => "1")
    end

  end
end
