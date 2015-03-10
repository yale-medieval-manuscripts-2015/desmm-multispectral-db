json.array!(@multi_spec_bar_charts) do |multi_spec_bar_chart|
  json.extract! multi_spec_bar_chart, :id, :MultiSpecSample_id, :barchart_png_filespec, :bar, :chart_png_image
  json.url multi_spec_bar_chart_url(multi_spec_bar_chart, format: :json)
end
