require "Hyper3dJson.rb"
include Hyper3dJson

class DiscoverController < ApplicationController
  respond_to :html, :json, :js

  def index
  end

  def browse
    authenticate_user!
    @samples =  MultispectralSample.all
  end

  def detail
    # the front-end needs to send the sample id for the detail page
    sample_id = params["sampleId"]
    #p 'sample_id = ' + sample_id.to_s
    @sample =  MultispectralSample.where(id: sample_id).first
    @sample.multispectral_sample_semantic_id
    #p 'in detail controller method: sample.id = ' + @sample.multispectral_sample_semantic_id
  end

  def respond_to_search
    :authenticate_user!
    manifest_list = ''
    tag_list = ''

    p "params = #{params.inspect}"

    params.each do |key, value|
      if key.start_with?('manifest_')
         manifest_list.concat("'").concat(value).concat("',")
      end
      if key.start_with?('tag_')
        tag_list.concat("'").concat(value).concat("',")
      end
    end
    manifest_list.chop!
    tag_list.chop!

    p "manifest_list = #{manifest_list}"
    p "tag_list = #{tag_list}"

    if manifest_list=='' and tag_list ==''
      @samples = MultispectralSample.all
      p "all"
    end

    if manifest_list != '' and tag_list == ''
      @samples =  MultispectralSample.where("manifest in (#{manifest_list})")
      p "manifest_list only"
    end

    if manifest_list == '' and tag_list != ''
    @samples =  MultispectralSample.where("id in (select multispectral_sample_id from multispectral_tags where hash_tag in (#{tag_list}))")
      p "tag_list only"
    end

    if manifest_list != '' and tag_list != ''
      @samples =  MultispectralSample.where("manifest in (#{manifest_list}) and id in (select multispectral_sample_id from multispectral_tags where hash_tag in (#{tag_list}))")
      p "manifest and tag lists"
    end
    respond_to do |format|
      format.js
    end
  end

end
