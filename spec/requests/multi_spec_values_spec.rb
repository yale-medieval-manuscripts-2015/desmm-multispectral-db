require 'rails_helper'

RSpec.describe "MultiSpecValues", :type => :request do
  describe "GET /multi_spec_values" do
    it "works! (now write some real specs)" do
      get multi_spec_values_path
      expect(response).to have_http_status(200)
    end
  end
end
