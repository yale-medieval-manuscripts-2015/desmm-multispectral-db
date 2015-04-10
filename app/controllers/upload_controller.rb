require "Hyper3dJson.rb"
include Hyper3dJson

class UploadController < ApplicationController
  def index
    render :file => 'app\views\upload\uploadfile.rhtml'
  end

  def uploadFile
    content_type = params[:upload]['datafile'].content_type
    @file_name = params[:upload]['datafile'].original_filename

    if content_type ==  'image/png'
      image_data = params[:upload]['datafile'].read
      mapHyper3dImageToModel image_data, @file_name
    end

    if content_type ==  'application/octet-stream'
        upload_data = params[:upload]['datafile'].read
        mapHyper3dJsonToModel upload_data
    end

    render :text => "File has been uploaded successfully"
    #respond_to do |format|
    #  format.html {redirect_to 'multi_spectral_samples#index'}
    #end
  end

  end
