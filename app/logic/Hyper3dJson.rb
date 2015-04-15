require "JSON"
require "IIIF_and_Tags.rb"
include IIIF_and_Tags

module Hyper3dJson

def mapHyper3dJsonToModel ms_json_str
  #puts 'in Hyper3dJson: content_type = ' + content_type
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
    msh_values['upload_status'] = 'succeeded'
    ms_values_array[i] = msh_values
    i+=1
  end
  msh['multispectral_values_attributes'] = ms_values_array

  # build barchart record
  msh_barchart = Hash.new
  msh_barchart['barchart_png_filename'] = ms_json['spectralImage']
  msh_barchart['barchart_png_image'] = 'image bytes here'
  msh_barchart['upload_status'] = 'image data not loaded'

  # if png was already uploaded, grab its image data, set status to 'complete' and delete it.
  bar = check_barchart_exists ms_json['spectralImage']
  if !bar.nil? && bar.upload_status == 'no parent'
    msh_barchart['barchart_png_image'] = bar.barchart_png_image
    msh_barchart['upload_status'] = 'complete'
    bar.destroy
  end
  msh['multispectral_barchart_attributes'] = msh_barchart

  # build initial tag records
  ms_tags_array = Array.new
  i = 0
  # need to have tagset and solr mappins first, or skip tags and add them later
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
  #msh['multispectral_tags_attributes'] = ms_tags_array #skip and add tags later

  # create initial sample and child records: tags, values and barchart
  multispec_sample = MultispectralSample.create(msh)

  result = getCanvas multispec_sample.exr_file_name
  ids = result.split('|')
  manifest_url = ids[0]
  canvas_id = ids[1]
  multispec_sample.update(manifest: manifest_url, canvas: canvas_id)

  # get annotation_list
  annoList = getAnnotationList canvas_id

  # use annotation_list to build unique tagset

  # send tagset to TagManger.getAllSolrMappingsforTagSet and get all solr_mappings

  # write children tags with tag names and solr categories and values

end

def mapHyper3dImageToModel image_data, filename

  puts 'in mapHyper3dImageToModel: '
  puts 'filename = ' + filename

  # todo:
  # Check if a barchart record already exists for this png
  #   - because initial rec was created with .msa file create
  #     - check that upload_status = 'image data not loaded' and has a foreign key
  #       - update THAT record with:
  #          - image_data
  #          - upload_status = 'complete'
  #   - because was already loaded before
  #     - ignore
  #  else create new orphan child to be associcated to sample collection when it is uploaded:

  # if there already is a child barchart record from, use this image data, set status to 'complete' and update it.
  bar = check_barchart_exists filename
  if !bar.nil? && bar.upload_status == 'image data not loaded'
    bar.barchart_png_image = image_data
    bar.upload_status = 'complete'
    bar.save
  else
    ms_barchart = MultispectralBarchart.create do |chart|
      chart.barchart_png_filename = filename
      chart.barchart_png_image = image_data
      chart.upload_status = 'no parent'
    end
  end
end

  def check_barchart_exists filename
    bar=MultispectralBarchart.find_by(barchart_png_filename:filename)
    if !bar.nil?
      puts 'check_barchart_exists: status = ' + bar.upload_status
    else
      puts 'bar is nil'
    end
    bar
  end
end