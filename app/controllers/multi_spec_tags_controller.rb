class MultiSpecTagsController < ApplicationController
  before_action :set_multi_spec_tag, only: [:show, :edit, :update, :destroy]

  # GET /multi_spec_tags
  # GET /multi_spec_tags.json
  def index
    @multi_spec_tags = MultiSpecTag.all
  end

  # GET /multi_spec_tags/1
  # GET /multi_spec_tags/1.json
  def show
  end

  # GET /multi_spec_tags/new
  def new
    @multi_spec_tag = MultiSpecTag.new
  end

  # GET /multi_spec_tags/1/edit
  def edit
  end

  # POST /multi_spec_tags
  # POST /multi_spec_tags.json
  def create
    @multi_spec_tag = MultiSpecTag.new(multi_spec_tag_params)

    respond_to do |format|
      if @multi_spec_tag.save
        format.html { redirect_to @multi_spec_tag, notice: 'Multi spec tag was successfully created.' }
        format.json { render :show, status: :created, location: @multi_spec_tag }
      else
        format.html { render :new }
        format.json { render json: @multi_spec_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multi_spec_tags/1
  # PATCH/PUT /multi_spec_tags/1.json
  def update
    respond_to do |format|
      if @multi_spec_tag.update(multi_spec_tag_params)
        format.html { redirect_to @multi_spec_tag, notice: 'Multi spec tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @multi_spec_tag }
      else
        format.html { render :edit }
        format.json { render json: @multi_spec_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multi_spec_tags/1
  # DELETE /multi_spec_tags/1.json
  def destroy
    @multi_spec_tag.destroy
    respond_to do |format|
      format.html { redirect_to multi_spec_tags_url, notice: 'Multi spec tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multi_spec_tag
      @multi_spec_tag = MultiSpecTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multi_spec_tag_params
      params.require(:multi_spec_tag).permit(:multi_spec_sample_id, :Tag, :TagValue, :upload_status)
    end
end
