module SearchHelper

  def addManifestFilterOptions
    manifests = MultispectralSample.get_manifests
    html = '<fieldset>'
    html += "<label style='padding-left:20px'><input type='checkbox' name='manifests' id='toggle_manifests' class='toggle_manifests'/>Select/Unselect all Manuscripts </label><br>"
    i = 0;
    manifests.each do |manifest|
      p "manifest[:manifest] = #{manifest[:label]}"
      if (!manifest[:label].nil?)
        i+= 1
        name = 'manifest_' + i.to_s
        html += "<label style='padding-left:20px'><input type='checkbox' name='#{name}' id='#{name}' value='#{manifest[:manifest]}' />#{manifest[:label]} </label><br>"
      end
    end
    html += '</fieldset>'
    html.html_safe
  end

  def addTagFilterOptions
    tags = MultispectralTag.get_tags
    html = '<fieldset>'
    html += "<label style='padding-left:8px'><input type='checkbox' name='tags' id='toggle_tags' class='toggle_tags'/>Select/Unselect all Tags </label><br>"
    i = 0;
    tags.each do |tag|
      i+= 1
      name = 'tag_' + i.to_s
      html += "<label style='padding-left:8px'><input type='checkbox' name='#{name}' id='#{name}' value='#{tag[:tag]}' />#{tag[:facet]}</label><br>"
    end
    html += '</fieldset>'
    html.html_safe
  end

end
