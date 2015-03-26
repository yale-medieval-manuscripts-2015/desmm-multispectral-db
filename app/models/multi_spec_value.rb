class MultiSpecValue < ActiveRecord::Base
belongs_to :MultiSpecSample

attr_accessible :multi_spec_sample_id,
                :wavelength,
                :range,
                :value,
                :reflectance,
                :normalized,
                :upload_status
end

