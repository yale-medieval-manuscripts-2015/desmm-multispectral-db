json.array!(@multi_spec_samples) do |multi_spec_sample|
  json.extract! multi_spec_sample, :id, :multi_spec_sample_id, :manifest, :canvas, :x, :y, :creatingApplication, :comment, :exrFileName, :user, :profileID, :upload_status
  json.url multi_spec_sample_url(multi_spec_sample, format: :json)
end
