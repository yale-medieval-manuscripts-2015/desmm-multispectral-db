require 'rails_helper'

RSpec.describe "multi_spec_values/index", :type => :view do
  before(:each) do
    assign(:multi_spec_values, [
      MultiSpecValue.create!(
        :multi_spec_sample_id => "Multi Spec Sample",
        :wavelength => "Wavelength",
        :range => 1,
        :value => 1.5,
        :reflectance => 2,
        :normalized => false,
        :upload_status => "Upload Status"
      ),
      MultiSpecValue.create!(
        :multi_spec_sample_id => "Multi Spec Sample",
        :wavelength => "Wavelength",
        :range => 1,
        :value => 1.5,
        :reflectance => 2,
        :normalized => false,
        :upload_status => "Upload Status"
      )
    ])
  end

  it "renders a list of multi_spec_values" do
    render
    assert_select "tr>td", :text => "Multi Spec Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Wavelength".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Upload Status".to_s, :count => 2
  end
end
