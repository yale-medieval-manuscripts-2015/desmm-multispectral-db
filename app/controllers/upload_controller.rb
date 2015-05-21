require "Hyper3dJson.rb"
include Hyper3dJson

class UploadController < ApplicationController
  respond_to :html, :json
  def index
    p 'index method'
    #render :file => 'app\views\upload\uploadfile.rhtml'
    #render :file => 'app\views\upload\index.html.erb'
  end

  def uploadFile
    #sleep 5
    p 'In uploadController#uploadFile'

    batch_id = params["batchId"]
    batch_id = '1' # temporary
    #p 'batch_id = ' + batch_id.to_s

    #@content_type = params[:upload]['datafile'].content_type
    #@file_name = params[:upload]['datafile'].original_filename
    @content_type = params['file'].content_type
    @file_name = params['file'].original_filename
    p 'params inspect: ' + params.inspect

    if @content_type ==  'image/png'
      p 'png'
      #image_data = params[:upload]['datafile'].read
      image_data = params['file'].read
      mapHyper3dImageToModel image_data, @file_name
    end

    if @content_type ==  'application/octet-stream'
      p 'msa'
        #upload_data = params[:upload]['datafile'].read
        upload_data = params['file'].read
        mapHyper3dJsonToModel upload_data, batch_id
    end

    p 'All done with ' + @file_name
    p 'current_user = ' + current_user.uid

    #render :text => "File has been uploaded successfully"
    #respond_to do |format|
      #format.html {redirect_to 'multi_spectral_samples#index'}
      #format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
      #format.html {redirect_to 'upload#index', notice: 'Files were successfully uploaded.'}
    #end
  end

  end