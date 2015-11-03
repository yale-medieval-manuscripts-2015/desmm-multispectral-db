require "Hyper3dJson.rb"
include Hyper3dJson

class DiscoverController < ApplicationController
  respond_to :html, :json

  def index
  end

  def browse
    authenticate_user!
    @samples =  MultispectralSample.all
  end

  def respond_to_search
    #:authenticate_user!
    p "in browse#search! params = " + params.inspect
    p "in browse#search! manifest = " + params["manifest"]
    #@samples =  MultispectralSample.all
    @samples =  MultispectralSample.where(manifest:params["manifest"])

    respond_to do |format|
      format.js
    end
  end

end

