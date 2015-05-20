class MultispectralSample < ActiveRecord::Base
  has_many :multispectral_values
  has_many :multispectral_tags
  has_one :multispectral_barchart

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
                  :md_language
end
