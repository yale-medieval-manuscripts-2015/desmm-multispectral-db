require 'rails_helper'

RSpec.describe "multi_spec_samples/show", :type => :view do
  before(:each) do
    @multi_spec_sample = assign(:multi_spec_sample, MultiSpecSample.create!(
      :multi_spec_sample_id => "Multi Spec Sample",
      :manifest => "Manifest",
      :canvas => "Canvas",
      :x => 1,
      :y => 2,
      :creatingApplication => "Creating Application",
      :comment => "MyText",
      :exrFileName => "Exr File Name",
      :user => "User",
      :profileID => 3,
      :upload_status => "Upload Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Multi Spec Sample/)
    expect(rendered).to match(/Manifest/)
    expect(rendered).to match(/Canvas/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Creating Application/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Exr File Name/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Upload Status/)
  end
end
