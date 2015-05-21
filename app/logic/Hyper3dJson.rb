require "JSON"
require 'set'
require "IIIF_and_Tags.rb"
include IIIF_and_Tags

module Hyper3dJson

  def mapHyper3dJsonToModel ms_json_str, batch_id

    #puts 'in Hyper3dJson: content_type = ' + content_type
    ms_json = JSON.parse(ms_json_str)
    msh = Hash.new

    # build sample record
    msh['multispectral_sample_semantic_id'] = ms_json['originalImage'] + '_' + ms_json['sampleLocation']['x' ].to_s + '_' + ms_json['sampleLocation']['y' ].to_s
    sample = check_sample_exists msh['multispectral_sample_semantic_id']
    sample.multispectral_barchart.destroy if !sample.nil?
    sample.destroy if !sample.nil?
    #msh['user'] =  current_user.uid
    msh['user'] =  current_user.name
    msh['batch_id'] = batch_id.to_s
    p '************ batch_id written: ' + msh['batch_id']
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
    msh['profile_id'] = MultispectralConfig.get("profile")
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


    msh_barchart = Hash.new
    # if png was already uploaded, grab its image data, set status to 'complete' and delete it.
    bar = check_barchart_exists ms_json['spectralImage']
    if !bar.nil?
      if bar.upload_status == 'no parent'
        msh_barchart['barchart_png_image'] = bar.barchart_png_image
        msh_barchart['upload_status'] = 'complete'
        msh['multispectral_barchart_attributes'] = msh_barchart
        bar.destroy
        #bar.destroy(bar.id)
      end
    else
      # build barchart record
      msh_barchart['barchart_png_filename'] = ms_json['spectralImage']
      msh_barchart['barchart_png_image'] = 'image bytes here'
      msh_barchart['upload_status'] = 'image data not loaded'
      msh['multispectral_barchart_attributes'] = msh_barchart
    end

    # create initial sample and child records: values and barchart
    msh['canvas'] = '1) initial creation; no manifest/canvas info, no tags'
    multispec_sample = MultispectralSample.create(msh)

    # get canvas for canvas_id and manifest
    result = getCanvas multispec_sample.exr_file_name
    if !result.nil?
      ids = result.split('|')
      manifestUrl = ids[0]
      canvasId = ids[1]
      canvasLabel = ids[2]
      manifestLabel = ids[3]
      p 'canvasLabel = ' + canvasLabel
      multispec_sample.update(manifest: manifestUrl,canvas: canvasId, canvas_label: canvasLabel, manifest_label: manifestLabel, upload_status: '2) has manifest/canvas info; no tags')

      # get tags via annotation list and create tag records per solr mapping
      # get annotation_list
      resources = getAnnotationList canvasId, multispec_sample.x, multispec_sample.y  #array of annotationList resource elements

      # get tag set from annotation list
      tagSet = createTagSet resources

      # send tagset to TagManger.getAllSolrMappingsforTagSet and get all solr_mappings
      tagSetStr = tagSet.to_a.join(' ')
      tagSetStr.gsub!(/#/,'').gsub!(/\s/,"%20") unless tagSetStr.empty?

      @tagSetUrl = SolrConnectConfig.get("tagSetUrl")
      tagSetUrl =  @tagSetUrl + tagSetStr
      #tagUrl =  SolrConnectConfig.get("tagSetUrl") + tagSetStr
      jsonTagCat = JSON.parse(open(tagSetUrl).read)

      # write children tags with tag names and solr categories and values
      tagSet.each do |tag|
        if !jsonTagCat[tag].nil?
          tagMap = jsonTagCat[tag]
          tagMap.each do |element|
            hash = Hash[*element.flatten]
            solrField = hash['solrfield'].to_s
            solrValue = hash['solrvalue'].to_s
            msh_tag = Hash.new
            msh_tag['hash_tag'] = tag
            msh_tag['facet_category'] = solrField
            msh_tag['facet_value'] = solrValue
            msh_tag['upload_status'] = 'complete'
            multispec_sample.multispectral_tags.create(msh_tag)
          end
        end
      end
      multispec_sample.update(manifest: manifestUrl, canvas: canvasId, upload_status: '3) complete')

    end
  end

  def mapHyper3dImageToModel image_data, filename
    bar = check_barchart_exists filename
    if !bar.nil?
      if bar.upload_status == 'image data not loaded'
        bar.barchart_png_image = image_data
        bar.upload_status = 'complete'
        p 'bar.upload_status set to: ' +  bar.upload_status
        bar.save
      end
    else
      MultispectralBarchart.create do |chart|
        chart.barchart_png_filename = filename
        chart.barchart_png_image = image_data
        chart.upload_status = 'no parent'
      end
    end
  end

  def check_sample_exists semantic_id
    sample=MultispectralSample.find_by(multispectral_sample_semantic_id:semantic_id)
    sample
  end

  def check_barchart_exists filename
    p 'barchart check: filename = ' + filename
    bar=MultispectralBarchart.find_by(barchart_png_filename:filename)
    #bar=MultispectralBarchart.where(:barchart_png_filename => filename)
    p 'status = ' + bar.barchart_png_filename if !bar.nil?
    p 'barchart check: ' + bar.nil?.to_s
    bar
  end
end