require "JSON"
module Hyper3dJson


def mapHyper3dJsonToModel ms_json
  #params = { member: { name: 'Jack', avatar_attributes: { icon: 'smiling' } } }
  #member = Member.create(params[:member])
  ms_sample =  {multispectral_sample_semantic_id:'Jack',
             user:'Player to be named later',
             manifest:'manifest to be named later',
             canvas:'canvas to be named later',
             x: 100,
             y: 200,
             wavelength:'nm',
             normalized: true,
             creating_application:'Hyper3d',
             creating_application_version:'1.0',
             comment:'test',
             exr_file_name:'test.exr',
             upload_status:'pending',
             multispectral_values_attributes: [{range:300.to_s,
                                                value:400.to_f,
                                                upload_status:'pending'}]

  }


  ms_sample = ActionController::Parameters.new(ms_sample)

  #puts 'before: ms_sample = ' + ms_sample.to_s
  multispec_sample = MultispectralSample.create(ms_sample)

  #puts 'Sample.id = ' + multispec_sample.id.to_s
  #puts 'Sample.user = ' + multispec_sample.user

  if multispec_sample.multispectral_values.nil?
    puts "No multi_spectral_values found for this sample"
  else
    puts "This sample appears to have some multi_spectral_values"
  end

  #puts 'values.upload_status = ' + multispec_sample.multi_spectral_values.upload_status # => 'pending'
  #puts 'values.upload_status = 'multispec_sample.multi_spectral_values.first.upload_status

  #roy = multispec_sample.multispectral_values.first
  #puts "!!: " + roy.upload_status

=begin
  puts 'original image = ' + ms_json['originalImage']
  #ms_json = params['ms_json']
  ms_json_str = params['ms_json']
  ms_json = JSON.parse(ms_json_str)
  puts 'mapHyper3dJsonToMode: json_string: ' + ms_json.to_s
  puts 'original image = ' + ms_json['originalImage']
  puts 'samples wavelength = ' + ms_json['samples']['wavelength'].to_s

  @ms = MultiSpectralSample.new
  #@ms = params['ms_sample']
  @ms.multi_spectral_sample_id =  ms_json['originalImage'] + '_' + ms_json['sampleLocation']['x' ].to_s + '_' + ms_json['sampleLocation']['y' ].to_s
  @ms.user = 'user to be named later'
  @ms.manifest = 'manifest to be named later'
  @ms.canvas = 'canvas to be named later'
  @ms.x = ms_json['sampleLocation']['x']
  @ms.y = ms_json['sampleLocation']['y']
  @ms.wavelength = ms_json['samples']['wavelength']
  @ms.reflectance = ms_json['samples']['reflectance']
  @ms.normalized = ms_json['samples']['normalized']
  @ms.creating_application = ms_json['creatingApplication']['name']
  @ms.creating_application_version = ms_json['creatingApplication']['version']
  @ms.comment = ms_json['comment']
  @ms.exr_file_name = ms_json['originalImage']
  @ms.save

  # build values records
  ms_json['samples']['values'].each do |value|
    @ms.multi_spectral_values.create(#multi_spectral_sample_id:@id,
                                     range:value[0],
                                     value:value[1].to_f,
                                     upload_status:'pending')
  end

  # build barchart record
  @ms.multi_spectral_bar_charts.create(multi_spectral_sample_id:@id,
                                       barchart_png_filename:ms_json['spectralImage'],
                                       bar:'is this needed',
                                       upload_status:'pending')
  # build initial tag records
  #tags = Array.new
  tags = getTags(ms_json['originalImage'])
  #tags = ['#adam', 'eve', '#adamandeve']
  tags.each do |tag|
    tag.gsub!(/#/,"")
    @ms.multi_spectral_tags.create(multi_spectral_sample_id:@id,
                                   Tag:tag,
                                   upload_status:'pending')
  end

  # create initial child records: tags, values and barchart
  #@barchart.create()
  #tags.build()
  #values.build()
=end
  #ms_json
  respond_to do |format|
    format.html {redirect_to 'multi_spectral_samples#index'}
  end

  end

end