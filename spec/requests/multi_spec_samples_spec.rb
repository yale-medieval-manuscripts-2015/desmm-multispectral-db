require 'rails_helper'

RSpec.describe "MultiSpecSamples", :type => :request do
  describe "GET /multi_spec_samples" do
    it "works! (now write some real specs)" do
      get multi_spec_samples_path
      expect(response).to have_http_status(200)
    end
  end
end
