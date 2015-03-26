json.array!(@multi_spec_values) do |multi_spec_value|
  json.extract! multi_spec_value, :id, :multi_spec_sample_id, :wavelength, :range, :value, :reflectance, :normalized, :upload_status
  json.url multi_spec_value_url(multi_spec_value, format: :json)
end
