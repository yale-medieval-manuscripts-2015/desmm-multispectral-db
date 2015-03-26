require 'rails_helper'

RSpec.describe "multi_spec_bar_charts/edit", :type => :view do
  before(:each) do
    @multi_spec_bar_chart = assign(:multi_spec_bar_chart, MultiSpecBarChart.create!(
      :multi_spec_sample_id => "MyString",
      :barchart_png_filename => "MyString",
      :bar => "MyString",
      :chart_png_image => "",
      :upload_status => "MyString"
    ))
  end

  it "renders the edit multi_spec_bar_chart form" do
    render

    assert_select "form[action=?][method=?]", multi_spec_bar_chart_path(@multi_spec_bar_chart), "post" do

      assert_select "input#multi_spec_bar_chart_multi_spec_sample_id[name=?]", "multi_spec_bar_chart[multi_spec_sample_id]"

      assert_select "input#multi_spec_bar_chart_barchart_png_filename[name=?]", "multi_spec_bar_chart[barchart_png_filename]"

      assert_select "input#multi_spec_bar_chart_bar[name=?]", "multi_spec_bar_chart[bar]"

      assert_select "input#multi_spec_bar_chart_chart_png_image[name=?]", "multi_spec_bar_chart[chart_png_image]"

      assert_select "input#multi_spec_bar_chart_upload_status[name=?]", "multi_spec_bar_chart[upload_status]"
    end
  end
end
