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

  def upload_samples
  end

  def upload_target
    puts 'in upload-target method of controller'
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

  def createFromJson
    #ms_json = params['ms_json']
    ms_json_str = params['ms_json']
    ms_json = JSON.parse(ms_json_str)
    puts 'controller: json_string: ' + ms_json.to_s
    puts 'original image = ' + ms_json['originalImage']
    puts 'samples wavelength = ' + ms_json['samples']['wavelength'].to_s

    @ms = MultiSpecSample.new
    #@ms = params['ms_sample']
    @ms.multi_spec_sample_id =  ms_json['originalImage'] + '_' + ms_json['sampleLocation']['x' ].to_s + '_' + ms_json['sampleLocation']['y' ].to_s
    @ms.user = 'user to be named later'
    @ms.manifest = 'manifest to be named later'
    @ms.canvas = 'canvas to be named later'
    @ms.x = ms_json['sampleLocation']['x']
    @ms.y = ms_json['sampleLocation']['y']
    #@ms.wavelength = ms_json['samples']['wavelength']
    #@ms.reflectance = ms_json['samples']['reflectance']
    #@ms.normalized = ms_json['samples']['normalized']
    @ms.creatingApplication = ms_json['creatingApplication']['name']
    @ms.comment = ms_json['comment']
    @ms.exrFileName = ms_json['originalImage']
    @ms.save

    puts @ms.id
    # build barchart record
    @ms.multi_spec_bar_charts.create(multi_spec_sample_id:@id,
                                     barchart_png_filename:ms_json['spectralImage'],
                                     bar:'is this needed',
                                     upload_status:'pending')
    # build values records
    ms_json['samples']['values'].each do |value|
      @ms.multi_spec_values.create(multi_spec_sample_id:@id,
                                   range:value[0],
                                   value:value[1].to_f,
                                   wavelength:ms_json['samples']['wavelength'],
                                   reflectance: ms_json['samples']['reflectance'],
                                   normalized: ms_json['samples']['normalized'],
                                   upload_status:'pending')
    end

    # build initial tag records
    #tags = Array.new
    tags = getTags(ms_json['originalImage'])
    #tags = ['#adam', 'eve', '#adamandeve']
    tags.each do |tag|
      tag.gsub!(/#/,"")
      @ms.multi_spec_tags.create(multi_spec_sample_id:@id,
                                 Tag:tag,
                                 upload_status:'pending')
    end

    # create initial child records: tags, values and barchart
    #barchart.create()
    #tags.build()
    #values.build()
    #ms_json
    respond_to do |format|
      format.html {redirect_to 'multi_spec_samples#index'}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_multi_spec_sample
    @multi_spec_sample = MultiSpecSample.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def multi_spec_sample_params
    params.require(:multi_spec_sample).permit(:MultiSpecSample_id, :manifest, :manifest, :canvas, :x, :y, :wavelength, :reflectance, :normalized, :creatingApplication, :creatingApplication, :comment, :exrFileName, :user, :profileID, :upload_status)
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
