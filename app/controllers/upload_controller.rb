require "Hyper3dJson.rb"
include Hyper3dJson

class UploadController < ApplicationController
  def index
    render :file => 'app\views\upload\uploadfile.rhtml'
  end

  def uploadFile
    #ms_json_str = params[:upload]['datafile'].read
    if params['ms_json'].present?
      ms_json_str = params['ms_json']
    else
      ms_json_str = params[:upload]['datafile'].read
    end
    puts 'ms_json = ' + ms_json_str
    mapHyper3dJsonToModel ms_json_str

    render :text => "File has been uploaded successfully"
    #respond_to do |format|
    #  format.html {redirect_to 'multi_spectral_samples#index'}
    #end
  end

end
