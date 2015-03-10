json.array!(@multi_spec_tags) do |multi_spec_tag|
  json.extract! multi_spec_tag, :id, :MultiSpecSample_id, :, :Tag, :, :TagValue, :
  json.url multi_spec_tag_url(multi_spec_tag, format: :json)
end
