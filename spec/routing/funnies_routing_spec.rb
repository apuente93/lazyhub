require "spec_helper"

describe FunniesController do
  describe "routing" do

    it "routes to #index" do
      get("/funnies").should route_to("funnies#index")
    end

    it "routes to #new" do
      get("/funnies/new").should route_to("funnies#new")
    end

    it "routes to #show" do
      get("/funnies/1").should route_to("funnies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/funnies/1/edit").should route_to("funnies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/funnies").should route_to("funnies#create")
    end

    it "routes to #update" do
      put("/funnies/1").should route_to("funnies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/funnies/1").should route_to("funnies#destroy", :id => "1")
    end

  end
end
