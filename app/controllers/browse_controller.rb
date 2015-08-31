require "Hyper3dJson.rb"
include Hyper3dJson

class BrowseController < ApplicationController
  respond_to :html, :json

  def index
  end

  def browse
    #render :file => 'app\views\browse\browse.erb'
    #render :file => 'app\views\upload\index.html.erb'
    @batch_samples =  MultispectralSample.all
  end

  def search
    render :file => 'app\views\browse\browse.erb'
    #render :file => 'app\views\upload\index.html.erb'
  end

end

