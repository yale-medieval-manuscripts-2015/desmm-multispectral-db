class MultispectralValue < ActiveRecord::Base
  belongs_to :multispectral_sample

  attr_accessible :range,
                  :value,
                  :upload_status
end
