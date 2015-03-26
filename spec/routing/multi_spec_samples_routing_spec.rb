require "rails_helper"

RSpec.describe MultiSpecSamplesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/multi_spec_samples").to route_to("multi_spec_samples#index")
    end

    it "routes to #new" do
      expect(:get => "/multi_spec_samples/new").to route_to("multi_spec_samples#new")
    end

    it "routes to #show" do
      expect(:get => "/multi_spec_samples/1").to route_to("multi_spec_samples#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/multi_spec_samples/1/edit").to route_to("multi_spec_samples#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/multi_spec_samples").to route_to("multi_spec_samples#create")
    end

    it "routes to #update" do
      expect(:put => "/multi_spec_samples/1").to route_to("multi_spec_samples#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/multi_spec_samples/1").to route_to("multi_spec_samples#destroy", :id => "1")
    end

  end
end
