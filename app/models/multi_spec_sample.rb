require 'json'

class MultiSpecSample < ActiveRecord::Base
  has_many :multi_spec_tags, dependent: :destroy
  has_many :multi_spec_values, dependent: :destroy
  #has_one :multi_spec_bar_charts, dependent: :destroy
  has_many :multi_spec_bar_charts, dependent: :destroy


  attr_accessible :multi_spec_sample_id,
                  :manifest,
                  :canvas,
                  :x,
                  :y,
                  :wavelength,
                  :reflectance,
                  :normalized,
                  :creatingApplication,
                  :comment,
                  :exrFileName,
                  :user,
                  :profileID

  #def self.updateWithJsonData (ms, ms_json)
  def self.createWithJsonData (ms_json)
    ms = MultiSpecSample.new
    ms.multi_spec_sample_id =  ms_json['originalImage'] + '_' + ms_json['sampleLocation']['x' ].to_s + '_' + ms_json['sampleLocation']['y' ].to_s
    ms.user = 'user to be named later'
    ms.manifest = 'manifest to be named later'
    ms.canvas = 'canvas to be named later'
    ms.x = ms_json['sampleLocation']['x']
    ms.y = ms_json['sampleLocation']['y']
    ms.creatingApplication = ms_json['creatingApplication']['name']
    ms.comment = ms_json['comment']
    ms.exrFileName = ms_json['originalImage']
    ms.save
    @id = ms.id
    ms = nil
    @ms = MultiSpecSample.find(@id)

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


  end

  def self.getTags(exrFileName)
    # get manifestViaExrFileName
    # get manifest's annotation list
    # iterate thru annotations via annotation list
    # - if annotation encompasses sample (x,y) add to tag array
    # ?: do we want to get the solr mappings to use for search app?
    tags = Array.new
    tags = ['#adam', 'eve', '#adamandeve']
  end

end
