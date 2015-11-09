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

  def respond_to_search
    :authenticate_user!
    manifest_list = ''
    tag_list = ''
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
    @samples =  MultispectralSample.where("manifest in (#{manifest_list}) and id in (select multispectral_sample_id from multispectral_tags where hash_tag in (#{tag_list}))")
    respond_to do |format|
      format.js
    end
  end

end
