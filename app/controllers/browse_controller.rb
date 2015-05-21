require "Hyper3dJson.rb"
include Hyper3dJson

class BrowseController < ApplicationController
  respond_to :html, :json

  def search
    p 'search method'
    render :file => 'app\views\browse\browse.erb'
    #render :file => 'app\views\upload\index.html.erb'
  end

  def continue
    p 'continue method'
    #p params.inspect
    batch_id = params["batchId"]
    p 'batch_id = ' + batch_id.to_s
    batch_id = 1

    #@batch_samples =  MultispectralSample.where(:batch_id => 1) // or find_by
    @batch_samples =  MultispectralSample.all
    p 'sample count = ' + @batch_samples.count.to_s
  end

end