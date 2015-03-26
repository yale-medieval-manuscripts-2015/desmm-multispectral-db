require "rails_helper"

RSpec.describe MultiSpecValuesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/multi_spec_values").to route_to("multi_spec_values#index")
    end

    it "routes to #new" do
      expect(:get => "/multi_spec_values/new").to route_to("multi_spec_values#new")
    end

    it "routes to #show" do
      expect(:get => "/multi_spec_values/1").to route_to("multi_spec_values#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/multi_spec_values/1/edit").to route_to("multi_spec_values#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/multi_spec_values").to route_to("multi_spec_values#create")
    end

    it "routes to #update" do
      expect(:put => "/multi_spec_values/1").to route_to("multi_spec_values#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/multi_spec_values/1").to route_to("multi_spec_values#destroy", :id => "1")
    end

  end
end
