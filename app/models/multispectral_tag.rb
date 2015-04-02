class MultispectralTag < ActiveRecord::Base
  belongs_to :multispectral_sample

  attr_accessible :hash_tag,
                  :facet_category,
                  :facet_value,
                  :upload_status
end
