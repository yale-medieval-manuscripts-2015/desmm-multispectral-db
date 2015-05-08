require "JSON"
require 'open-uri'

module IIIF_and_Tags

  def getCanvas exrFileName
    # lookup canvas_id via filename_canvas_lookup
    fileName = exrFileName.gsub!('.exr', '')

    p 'fileName for canvasLookup = ' + fileName

    canvasLookup = CanvasLookup.where("object_file_id LIKE ?", "#{fileName}%").first

    p ' no canvas luck' if canvasLookup.nil?

    if canvasLookup.nil?
      results = ""
      return
    end

    canvas_id = canvasLookup.canvas_id

    # get canvas JSON via IIIF API in order to get the manifest url
    @canvasUrl = SolrConnectConfig.get("canvasUrl") + canvas_id
    jsonCanvas = JSON.parse(open(@canvasUrl).read)
    manifestUrl = jsonCanvas['within'][0]
    results = manifestUrl + "|" + canvas_id
  end

  def getAnnotationList canvas_id, x, y
    annotationListUrl = @canvasUrl
    annotationListUrl += canvas_id
    annotationListUrl += '/search?region='
    annotationListUrl += x.to_s + ',' + y.to_s + ',12000,12000'
    jsonAnnotationList = JSON.parse(open(annotationListUrl).read)
    jsonResources = jsonAnnotationList['resources'] # Returns array
  end

  # use annotation_list to build unique tagset
  def createTagSet resources
    tagSet = Set.new
    resources.each do | resource |
      chars = resource['resource']['chars']
      terms = chars.split(' ')
      terms.each do |term|
        tagSet.add term if term.start_with?('#')
      end
    end
    tagSet
  end
end