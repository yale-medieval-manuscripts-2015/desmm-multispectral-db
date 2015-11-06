module SearchHelper

  def addManifestFilterOptions
    manifests = MultispectralSample.get_manifests
    html = ''
    i = 0;
    manifests.each do |manifest|
      #html += "<label><input type='checkbox' name='#{manifest[:manifest]}' value='#{manifest[:manifest]}' />#{manifest[:label]} </label>"
      i+= 1
      name = 'manifest_' + i.to_s
      html += "<label style='padding-left:20px'><input type='checkbox' name='#{name}' value='#{manifest[:manifest]}' />#{manifest[:label]} </label>"

    end
    html.html_safe
  end

  def addTagFilterOptions
    tags = MultispectralTag.get_tags
    html = ''
    i = 0;
    tags.each do |tag|
      i+= 1
      name = 'tag_' + i.to_s
      html += "<label style='padding-left:20px'><input type='checkbox' name='#{name}' value='#{tag[:tag]}' />#{tag[:facet]} </label>"
    end
    html.html_safe
  end

end
