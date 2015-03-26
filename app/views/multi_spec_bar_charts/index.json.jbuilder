json.array!(@multi_spec_bar_charts) do |multi_spec_bar_chart|
  json.extract! multi_spec_bar_chart, :id, :multi_spec_sample_id, :barchart_png_filename, :bar, :chart_png_image, :upload_status
  json.url multi_spec_bar_chart_url(multi_spec_bar_chart, format: :json)
end
