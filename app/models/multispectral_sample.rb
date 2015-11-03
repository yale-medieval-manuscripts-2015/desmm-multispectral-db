class MultispectralSample < ActiveRecord::Base

  has_many :multispectral_values
  has_many :multispectral_tags
  has_one :multispectral_barchart

  acts_as_commontable

  accepts_nested_attributes_for :multispectral_values
  accepts_nested_attributes_for :multispectral_tags
  accepts_nested_attributes_for :multispectral_barchart

  attr_accessible :multispectral_sample_semantic_id,
                  :manifest,
                  :canvas,
                  :x,
                  :y,
                  :wavelength,
                  :reflectance,
                  :normalized,
                  :creating_application,
                  :creating_application_version,
                  :comment,
                  :exr_file_name,
                  :user,
                  :profile_id,
                  :upload_status,
                  :multispectral_values_attributes,
                  :multispectral_barchart_attributes,
                  :multispectral_tags_attributes,
                  :manifest_label,
                  :canvas_label,
                  :institution,
                  :license,
                  :md_date,
                  :md_provenance,
                  :md_material,
                  :md_language,
                  :batch_id

  def self.get_manifests_for_select
=begin
    @samples = MultispectralSample.all
    select_options = Array.new
    @samples.each do |sample|
      manifest_element = Array.new
      manifest_element[0] = sample.manifest
      manifest_element[1] = sample.manifest
      p 'manifest_element[0] = ' + manifest_element[0].to_s
      select_options.push(manifest_element)
    end
    p "select_options = #{select_options.inspect}"
    select_options
=end

    @samples = MultispectralSample.all
    @samples = MultispectralSample.select(:manifest).distinct
    select_options = Array.new
    @samples.each do |sample|
      manifest_element = Array.new
      manifest_element[0] = sample.manifest
      manifest_element[1] = sample.manifest
      select_options.push(manifest_element)
    end
    select_options
  end

end