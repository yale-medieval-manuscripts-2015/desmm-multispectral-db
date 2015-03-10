json.array!(@multi_spec_samples) do |multi_spec_sample|
  json.extract! multi_spec_sample, :id, :MultiSpecSample_id, :manifest, :manifest, :canvas, :x, :y, :wavelength, :reflectance, :normalized, :creatingApplication, :creatingApplication, :comment, :exrFileName, :user, :createdOn, :profileID
  json.url multi_spec_sample_url(multi_spec_sample, format: :json)
end
