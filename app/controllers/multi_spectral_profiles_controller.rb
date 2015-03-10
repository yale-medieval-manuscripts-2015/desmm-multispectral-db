class MultiSpectralProfilesController < ApplicationController
  before_action :set_multi_spectral_profile, only: [:show, :edit, :update, :destroy]

  # GET /multi_spectral_profiles
  # GET /multi_spectral_profiles.json
  def index
    @multi_spectral_profiles = MultiSpectralProfile.all
  end

  # GET /multi_spectral_profiles/1
  # GET /multi_spectral_profiles/1.json
  def show
  end

  # GET /multi_spectral_profiles/new
  def new
    @multi_spectral_profile = MultiSpectralProfile.new
  end

  # GET /multi_spectral_profiles/1/edit
  def edit
  end

  # POST /multi_spectral_profiles
  # POST /multi_spectral_profiles.json
  def create
    @multi_spectral_profile = MultiSpectralProfile.new(multi_spectral_profile_params)

    respond_to do |format|
      if @multi_spectral_profile.save
        format.html { redirect_to @multi_spectral_profile, notice: 'Multi spectral profile was successfully created.' }
        format.json { render :show, status: :created, location: @multi_spectral_profile }
      else
        format.html { render :new }
        format.json { render json: @multi_spectral_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_spectral_profiles/1
  # PATCH/PUT /multi_spectral_profiles/1.json
  def update
    respond_to do |format|
      if @multi_spectral_profile.update(multi_spectral_profile_params)
        format.html { redirect_to @multi_spectral_profile, notice: 'Multi spectral profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @multi_spectral_profile }
      else
        format.html { render :edit }
        format.json { render json: @multi_spectral_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_spectral_profiles/1
  # DELETE /multi_spectral_profiles/1.json
  def destroy
    @multi_spectral_profile.destroy
    respond_to do |format|
      format.html { redirect_to multi_spectral_profiles_url, notice: 'Multi spectral profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_spectral_profile
      @multi_spectral_profile = MultiSpectralProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_spectral_profile_params
      params.require(:multi_spectral_profile).permit(:profileId, :NumBands, :BandRanges, :notes)
    end
end
