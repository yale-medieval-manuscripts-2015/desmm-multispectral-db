require 'rails_helper'

RSpec.describe "multi_spec_values/new", :type => :view do
  before(:each) do
    assign(:multi_spec_value, MultiSpecValue.new(
      :multi_spec_sample_id => "MyString",
      :wavelength => "MyString",
      :range => 1,
      :value => 1.5,
      :reflectance => 1,
      :normalized => false,
      :upload_status => "MyString"
    ))
  end

  it "renders new multi_spec_value form" do
    render

    assert_select "form[action=?][method=?]", multi_spec_values_path, "post" do

      assert_select "input#multi_spec_value_multi_spec_sample_id[name=?]", "multi_spec_value[multi_spec_sample_id]"

      assert_select "input#multi_spec_value_wavelength[name=?]", "multi_spec_value[wavelength]"

      assert_select "input#multi_spec_value_range[name=?]", "multi_spec_value[range]"

      assert_select "input#multi_spec_value_value[name=?]", "multi_spec_value[value]"

      assert_select "input#multi_spec_value_reflectance[name=?]", "multi_spec_value[reflectance]"

      assert_select "input#multi_spec_value_normalized[name=?]", "multi_spec_value[normalized]"

      assert_select "input#multi_spec_value_upload_status[name=?]", "multi_spec_value[upload_status]"
    end
  end
end
