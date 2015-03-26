require 'rails_helper'

RSpec.describe "MultiSpecBarCharts", :type => :request do
  describe "GET /multi_spec_bar_charts" do
    it "works! (now write some real specs)" do
      get multi_spec_bar_charts_path
      expect(response).to have_http_status(200)
    end
  end
end
