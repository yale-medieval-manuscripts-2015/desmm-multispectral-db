class MultiSpecSamplesController < ApplicationController
  before_action :set_multi_spec_sample, only: [:show, :edit, :update, :destroy]

  # GET /multi_spec_samples
  # GET /multi_spec_samples.json
  def index
    @multi_spec_samples = MultiSpecSample.all
  end

  # GET /multi_spec_samples/1
  # GET /multi_spec_samples/1.json
  def show
  end

  # GET /multi_spec_samples/new
  def new
    @multi_spec_sample = MultiSpecSample.new
  end

  # GET /multi_spec_samples/1/edit
  def edit
  end

  # POST /multi_spec_samples
  # POST /multi_spec_samples.json
  def create
    @multi_spec_sample = MultiSpecSample.new(multi_spec_sample_params)

    respond_to do |format|
      if @multi_spec_sample.save
        format.html { redirect_to @multi_spec_sample, notice: 'Multi spec sample was successfully created.' }
        format.json { render :show, status: :created, location: @multi_spec_sample }
      else
        format.html { render :new }
        format.json { render json: @multi_spec_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_spec_samples/1
  # PATCH/PUT /multi_spec_samples/1.json
  def update
    respond_to do |format|
      if @multi_spec_sample.update(multi_spec_sample_params)
        format.html { redirect_to @multi_spec_sample, notice: 'Multi spec sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @multi_spec_sample }
      else
        format.html { render :edit }
        format.json { render json: @multi_spec_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_spec_samples/1
  # DELETE /multi_spec_samples/1.json
  def destroy
    @multi_spec_sample.destroy
    respond_to do |format|
      format.html { redirect_to multi_spec_samples_url, notice: 'Multi spec sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_spec_sample
      @multi_spec_sample = MultiSpecSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_spec_sample_params
      params.require(:multi_spec_sample).permit(:MultiSpecSample_id, :manifest, :manifest, :canvas, :x, :y, :wavelength, :reflectance, :normalized, :creatingApplication, :creatingApplication, :comment, :exrFileName, :user, :createdOn, :profileID)
    end
end
