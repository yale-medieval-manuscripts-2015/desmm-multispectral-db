class MultispectralTag < ActiveRecord::Base
  belongs_to :multispectral_sample

  attr_accessible :hash_tag,
                  :facet_category,
                  :facet_value,
                  :upload_status

def self.get_tags
    @tags = MultispectralTag.select(:facet_value, :hash_tag).distinct
    select_options = Array.new
    @tags.each do |tag|
      tag_and_facet = Hash.new
      tag_and_facet[:tag] = tag.hash_tag
      tag_and_facet[:facet] = tag.facet_value
      select_options.push(tag_and_facet)
    end
    select_options
  end
end