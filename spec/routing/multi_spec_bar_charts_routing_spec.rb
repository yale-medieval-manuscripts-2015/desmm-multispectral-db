require "rails_helper"

RSpec.describe MultiSpecBarChartsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/multi_spec_bar_charts").to route_to("multi_spec_bar_charts#index")
    end

    it "routes to #new" do
      expect(:get => "/multi_spec_bar_charts/new").to route_to("multi_spec_bar_charts#new")
    end

    it "routes to #show" do
      expect(:get => "/multi_spec_bar_charts/1").to route_to("multi_spec_bar_charts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/multi_spec_bar_charts/1/edit").to route_to("multi_spec_bar_charts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/multi_spec_bar_charts").to route_to("multi_spec_bar_charts#create")
    end

    it "routes to #update" do
      expect(:put => "/multi_spec_bar_charts/1").to route_to("multi_spec_bar_charts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/multi_spec_bar_charts/1").to route_to("multi_spec_bar_charts#destroy", :id => "1")
    end

  end
end
