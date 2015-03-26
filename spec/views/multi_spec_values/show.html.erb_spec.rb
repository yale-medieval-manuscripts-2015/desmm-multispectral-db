require 'rails_helper'

RSpec.describe "multi_spec_values/show", :type => :view do
  before(:each) do
    @multi_spec_value = assign(:multi_spec_value, MultiSpecValue.create!(
      :multi_spec_sample_id => "Multi Spec Sample",
      :wavelength => "Wavelength",
      :range => 1,
      :value => 1.5,
      :reflectance => 2,
      :normalized => false,
      :upload_status => "Upload Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Multi Spec Sample/)
    expect(rendered).to match(/Wavelength/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Upload Status/)
  end
end
