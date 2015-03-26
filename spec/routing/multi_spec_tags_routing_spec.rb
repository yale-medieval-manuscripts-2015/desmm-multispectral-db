require "rails_helper"

RSpec.describe MultiSpecTagsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/multi_spec_tags").to route_to("multi_spec_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/multi_spec_tags/new").to route_to("multi_spec_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/multi_spec_tags/1").to route_to("multi_spec_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/multi_spec_tags/1/edit").to route_to("multi_spec_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/multi_spec_tags").to route_to("multi_spec_tags#create")
    end

    it "routes to #update" do
      expect(:put => "/multi_spec_tags/1").to route_to("multi_spec_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/multi_spec_tags/1").to route_to("multi_spec_tags#destroy", :id => "1")
    end

  end
end
