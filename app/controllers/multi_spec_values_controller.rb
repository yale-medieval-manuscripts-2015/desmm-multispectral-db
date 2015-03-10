class MultiSpecValuesController < ApplicationController
  before_action :set_multi_spec_value, only: [:show, :edit, :update, :destroy]

  # GET /multi_spec_values
  # GET /multi_spec_values.json
  def index
    @multi_spec_values = MultiSpecValue.all
  end

  # GET /multi_spec_values/1
  # GET /multi_spec_values/1.json
  def show
  end

  # GET /multi_spec_values/new
  def new
    @multi_spec_value = MultiSpecValue.new
  end

  # GET /multi_spec_values/1/edit
  def edit
  end

  # POST /multi_spec_values
  # POST /multi_spec_values.json
  def create
    @multi_spec_value = MultiSpecValue.new(multi_spec_value_params)

    respond_to do |format|
      if @multi_spec_value.save
        format.html { redirect_to @multi_spec_value, notice: 'Multi spec value was successfully created.' }
        format.json { render :show, status: :created, location: @multi_spec_value }
      else
        format.html { render :new }
        format.json { render json: @multi_spec_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_spec_values/1
  # PATCH/PUT /multi_spec_values/1.json
  def update
    respond_to do |format|
      if @multi_spec_value.update(multi_spec_value_params)
        format.html { redirect_to @multi_spec_value, notice: 'Multi spec value was successfully updated.' }
        format.json { render :show, status: :ok, location: @multi_spec_value }
      else
        format.html { render :edit }
        format.json { render json: @multi_spec_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_spec_values/1
  # DELETE /multi_spec_values/1.json
  def destroy
    @multi_spec_value.destroy
    respond_to do |format|
      format.html { redirect_to multi_spec_values_url, notice: 'Multi spec value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_spec_value
      @multi_spec_value = MultiSpecValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_spec_value_params
      params.require(:multi_spec_value).permit(:MultiSpecSample_id, :range, :value)
    end
end
