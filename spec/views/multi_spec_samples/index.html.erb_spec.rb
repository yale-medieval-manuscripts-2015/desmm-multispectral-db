require 'rails_helper'

RSpec.describe "multi_spec_samples/index", :type => :view do
  before(:each) do
    assign(:multi_spec_samples, [
      MultiSpecSample.create!(
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
      ),
      MultiSpecSample.create!(
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
      )
    ])
  end

  it "renders a list of multi_spec_samples" do
    render
    assert_select "tr>td", :text => "Multi Spec Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Manifest".to_s, :count => 2
    assert_select "tr>td", :text => "Canvas".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Creating Application".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Exr File Name".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Upload Status".to_s, :count => 2
  end
end
