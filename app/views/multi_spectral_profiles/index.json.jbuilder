json.array!(@multi_spectral_profiles) do |multi_spectral_profile|
  json.extract! multi_spectral_profile, :id, :profileId, :NumBands, :BandRanges, :notes
  json.url multi_spectral_profile_url(multi_spectral_profile, format: :json)
end
