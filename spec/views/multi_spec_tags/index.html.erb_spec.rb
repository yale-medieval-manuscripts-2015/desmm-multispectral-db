require 'rails_helper'

RSpec.describe "multi_spec_tags/index", :type => :view do
  before(:each) do
    assign(:multi_spec_tags, [
      MultiSpecTag.create!(
        :multi_spec_sample_id => "Multi Spec Sample",
        :Tag => "Tag",
        :TagValue => "Tag Value",
        :upload_status => "Upload Status"
      ),
      MultiSpecTag.create!(
        :multi_spec_sample_id => "Multi Spec Sample",
        :Tag => "Tag",
        :TagValue => "Tag Value",
        :upload_status => "Upload Status"
      )
    ])
  end

  it "renders a list of multi_spec_tags" do
    render
    assert_select "tr>td", :text => "Multi Spec Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
    assert_select "tr>td", :text => "Tag Value".to_s, :count => 2
    assert_select "tr>td", :text => "Upload Status".to_s, :count => 2
  end
end
