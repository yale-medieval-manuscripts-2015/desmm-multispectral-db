require "Hyper3dJson.rb"
include Hyper3dJson

class MultiSpectralSamplesController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_multi_spec_sample, only: [:show, :edit, :update, :destroy]

  # GET /multi_spec_samples
  # GET /multi_spec_samples.json
  def index
    @multi_spectral_samples = MultiSpectralSample.all
  end

  # GET /multi_spectral_samples/1
  # GET /multi_spectral_samples/1.json
  def show
  end

  # GET /multi_spectral_samples/new
  def new
    @multi_spectral_sample = MultiSpectralSample.new
  end

  # GET /multi_spectral_samples/1/edit
  def edit
  end

  # POST /multi_spectral_samples
  # POST /multi_spectral_samples.json
  def create
    @multi_spectral_sample = MultiSpectralSample.new(multi_spectral_sample_params)

    respond_to do |format|
      if @multi_spectral_sample.save
        format.html { redirect_to @multi_spectral_sample, notice: 'Multi spec sample was successfully created.' }
        format.json { render :show, status: :created, location: @multi_spectral_sample }
      else
        format.html { render :new }
        format.json { render json: @multi_spectral_sample.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /multi_spectral_samples/1
  # DELETE /multi_spectral_samples/1.json
  def destroy
    @multi_spectral_sample.destroy
    respond_to do |format|
      format.html { redirect_to multi_spectral_samples_url, notice: 'Multi spec sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_multi_spectral_sample
    @multi_spectral_sample = MultiSpectralSample.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def multi_spectral_sample_params
    params.require(:multi_spectral_sample).permit(:MultiSpectralSample_id, :manifest, :manifest, :canvas, :x, :y, :wavelength, :reflectance, :normalized, :creatingApplication, :creatingApplication, :comment, :exrFileName, :user, :profileID, :upload_status)
  end

  def getTags(exrFileName)
    # get manifestViaExrFileName
    # get manifest's annotation list
    # iterate thru annotations via annotation list
    # - if annotation encompasses sample (x,y) add to tag array
    # ?: do we want to get the solr mappings to use for search app?
    tags = Array.new
    tags = ['#adam', 'eve', '#adamandeve']
  end
end
