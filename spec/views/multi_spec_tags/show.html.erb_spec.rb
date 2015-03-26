require 'rails_helper'

RSpec.describe "multi_spec_tags/show", :type => :view do
  before(:each) do
    @multi_spec_tag = assign(:multi_spec_tag, MultiSpecTag.create!(
      :multi_spec_sample_id => "Multi Spec Sample",
      :Tag => "Tag",
      :TagValue => "Tag Value",
      :upload_status => "Upload Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Multi Spec Sample/)
    expect(rendered).to match(/Tag/)
    expect(rendered).to match(/Tag Value/)
    expect(rendered).to match(/Upload Status/)
  end
end
