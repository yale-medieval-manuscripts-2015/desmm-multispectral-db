class MultiSpecBarChart < ActiveRecord::Base
  belongs_to :MultiSpecSample
  attr_accessible :multi_spec_sample_id,
                  :barchart_png_filename,
                  :bar,
                  :upload_status
end
