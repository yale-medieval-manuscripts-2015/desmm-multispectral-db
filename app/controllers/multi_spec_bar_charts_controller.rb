class MultiSpecBarChartsController < ApplicationController
  before_action :set_multi_spec_bar_chart, only: [:show, :edit, :update, :destroy]

  # GET /multi_spec_bar_charts
  # GET /multi_spec_bar_charts.json
  def index
    @multi_spec_bar_charts = MultiSpecBarChart.all
  end

  # GET /multi_spec_bar_charts/1
  # GET /multi_spec_bar_charts/1.json
  def show
  end

  # GET /multi_spec_bar_charts/new
  def new
    @multi_spec_bar_chart = MultiSpecBarChart.new
  end

  # GET /multi_spec_bar_charts/1/edit
  def edit
  end

  # POST /multi_spec_bar_charts
  # POST /multi_spec_bar_charts.json
  def create
    @multi_spec_bar_chart = MultiSpecBarChart.new(multi_spec_bar_chart_params)

    respond_to do |format|
      if @multi_spec_bar_chart.save
        format.html { redirect_to @multi_spec_bar_chart, notice: 'Multi spec bar chart was successfully created.' }
        format.json { render :show, status: :created, location: @multi_spec_bar_chart }
      else
        format.html { render :new }
        format.json { render json: @multi_spec_bar_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_spec_bar_charts/1
  # PATCH/PUT /multi_spec_bar_charts/1.json
  def update
    respond_to do |format|
      if @multi_spec_bar_chart.update(multi_spec_bar_chart_params)
        format.html { redirect_to @multi_spec_bar_chart, notice: 'Multi spec bar chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @multi_spec_bar_chart }
      else
        format.html { render :edit }
        format.json { render json: @multi_spec_bar_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_spec_bar_charts/1
  # DELETE /multi_spec_bar_charts/1.json
  def destroy
    @multi_spec_bar_chart.destroy
    respond_to do |format|
      format.html { redirect_to multi_spec_bar_charts_url, notice: 'Multi spec bar chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_spec_bar_chart
      @multi_spec_bar_chart = MultiSpecBarChart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_spec_bar_chart_params
      params.require(:multi_spec_bar_chart).permit(:multi_spec_sample_id, :barchart_png_filename, :bar, :chart_png_image, :upload_status)
    end
end
