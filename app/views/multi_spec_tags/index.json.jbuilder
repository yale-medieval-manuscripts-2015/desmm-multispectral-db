json.array!(@multi_spec_tags) do |multi_spec_tag|
  json.extract! multi_spec_tag, :id, :multi_spec_sample_id, :Tag, :TagValue, :upload_status
  json.url multi_spec_tag_url(multi_spec_tag, format: :json)
end
