json.array!(@activities) do |activity|
  json.extract! activity, :id, :MultiSpecSample_id, :, :Status, :UploadedOn, :UploadedBy
  json.url activity_url(activity, format: :json)
end
