require "spec_helper"

describe BusinessLinesController do
  describe "routing" do

    it "routes to #index" do
      get("/business_lines").should route_to("business_lines#index")
    end

    it "routes to #new" do
      get("/business_lines/new").should route_to("business_lines#new")
    end

    it "routes to #show" do
      get("/business_lines/1").should route_to("business_lines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_lines/1/edit").should route_to("business_lines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_lines").should route_to("business_lines#create")
    end

    it "routes to #update" do
      put("/business_lines/1").should route_to("business_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_lines/1").should route_to("business_lines#destroy", :id => "1")
    end

  end
end
