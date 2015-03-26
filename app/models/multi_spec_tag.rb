class MultiSpecTag < ActiveRecord::Base
  belongs_to :MultiSpecSample
  attr_accessible :multi_spec_sample_id,
                  :Tag,
                  :upload_status
end
