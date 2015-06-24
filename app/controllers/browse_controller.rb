require "Hyper3dJson.rb"
include Hyper3dJson

class BrowseController < ApplicationController
  respond_to :html, :json

  def index
  p 'in upload/index method'
  end

  def browse
    p 'browse method'
    #render :file => 'app\views\browse\browse.erb'
    #render :file => 'app\views\upload\index.html.erb'
  end

  def search
    p 'search method'
    render :file => 'app\views\browse\browse.erb'
    #render :file => 'app\views\upload\index.html.erb'
  end


end