json.array!(@multi_spec_values) do |multi_spec_value|
  json.extract! multi_spec_value, :id, :MultiSpecSample_id, :range, :value
  json.url multi_spec_value_url(multi_spec_value, format: :json)
end
