require 'rails_helper'

RSpec.describe "multi_spec_bar_charts/show", :type => :view do
  before(:each) do
    @multi_spec_bar_chart = assign(:multi_spec_bar_chart, MultiSpecBarChart.create!(
      :multi_spec_sample_id => "Multi Spec Sample",
      :barchart_png_filename => "Barchart Png Filename",
      :bar => "Bar",
      :chart_png_image => "",
      :upload_status => "Upload Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Multi Spec Sample/)
    expect(rendered).to match(/Barchart Png Filename/)
    expect(rendered).to match(/Bar/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Upload Status/)
  end
end
