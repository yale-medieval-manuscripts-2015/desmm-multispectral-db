require "JSON"
module Hyper3dJson


def mapHyper3dJsonToModel ms_json_str
  # ms_json_str = params['ms_json_str]
  # ms_json = JSON.parse(ms_json_str)
  ms_json = JSON.parse(ms_json_str)

  msh = Hash.new
  msh['multispectral_sample_semantic_id'] = ms_json['originalImage'] + '_' + ms_json['sampleLocation']['x' ].to_s + '_' + ms_json['sampleLocation']['y' ].to_s
  msh['user'] = 'user to be named later'
  msh['manifest'] = 'manifest to be named later'
  msh['canvas'] = 'canvas to be named later'
  msh['x'] = ms_json['sampleLocation']['x']
  msh['y'] = ms_json['sampleLocation']['y']
  msh['wavelength'] = ms_json['samples']['wavelength']
  msh['reflectance'] = ms_json['samples']['reflectance']
  msh['normalized'] = ms_json['samples']['normalized']
  msh['creating_application'] = ms_json['creatingApplication']['name']
  msh['creating_application_version'] = ms_json['creatingApplication']['version']
  msh['comment'] = ms_json['comment']
  msh['profile_id'] = 1
  msh['exr_file_name'] = ms_json['originalImage']

  # build values records
  ms_values_array = Array.new
  i = 0
  ms_json['samples']['values'].each do |value_pair|
    msh_values = Hash.new
    msh_values['range'] = value_pair[0],
    msh_values['value'] = value_pair[1].to_f,
    msh_values['upload_status'] = 'pending'
    ms_values_array[i] = msh_values
    i+=1
  end
  msh['multispectral_values_attributes'] = ms_values_array

  # build barchart record
  msh_barchart = Hash.new
  msh_barchart['barchart_png_filename'] = ms_json['spectralImage']
  msh_barchart['barchart_png_image'] = 'image bytes here'
  msh_barchart['upload_status'] = 'pending'
  msh['multispectral_barchart_attributes'] = msh_barchart

  # build initial tag records
  ms_tags_array = Array.new
  i = 0
  #tags = getTags(ms_json['originalImage'])
  tags = ['#adam', 'eve', '#adamandeve']
  tags.each do |tag|
    msh_tags = Hash.new
    msh_tags['hash_tag'] = tags[i]
    msh_tags['facet_category'] = 'not done'
    msh_tags['facet_value'] = 'not done'
    msh_tags['upload_status'] = 'pending'
    ms_tags_array[i] = msh_tags
    i += 1
  end
  msh['multispectral_tags_attributes'] = ms_tags_array

  # create initial sample and child records: tags, values and barchart
  multispec_sample = MultispectralSample.create(msh)

end
end