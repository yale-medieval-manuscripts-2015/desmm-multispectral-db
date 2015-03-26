require 'rails_helper'

RSpec.describe "multi_spec_bar_charts/index", :type => :view do
  before(:each) do
    assign(:multi_spec_bar_charts, [
      MultiSpecBarChart.create!(
        :multi_spec_sample_id => "Multi Spec Sample",
        :barchart_png_filename => "Barchart Png Filename",
        :bar => "Bar",
        :chart_png_image => "",
        :upload_status => "Upload Status"
      ),
      MultiSpecBarChart.create!(
        :multi_spec_sample_id => "Multi Spec Sample",
        :barchart_png_filename => "Barchart Png Filename",
        :bar => "Bar",
        :chart_png_image => "",
        :upload_status => "Upload Status"
      )
    ])
  end

  it "renders a list of multi_spec_bar_charts" do
    render
    assert_select "tr>td", :text => "Multi Spec Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Barchart Png Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Bar".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Upload Status".to_s, :count => 2
  end
end
