class MultispectralBarchart < ActiveRecord::Base
  belongs_to :multispectral_sample

  attr_accessible :barchart_png_filename,
                  :barchart_png_image,
                  :upload_status
end
