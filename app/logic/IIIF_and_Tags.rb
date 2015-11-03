#require "rubygems"
#require "JSON"
require 'open-uri'

module IIIF_and_Tags

  def getCanvas exrFileName
    # lookup canvas_id via filename_canvas_lookup
    fileName = exrFileName.gsub!('.exr', '')
    canvasLookup = CanvasLookup.where("object_file_id LIKE ?", "#{fileName}%").first
    #if canvasLookup.nil?
    #  results = ""
    #  return
    #end
    canvas_id = canvasLookup.canvas_id
    # get canvas JSON via IIIF API in order to get the manifest url
    @canvasUrl = SolrConnectConfig.get("canvasUrl") + canvas_id
    jsonCanvas = JSON.parse(open(@canvasUrl).read)
    canvasLabel = jsonCanvas['label']
    manifestUrl = jsonCanvas['within'][0]
    jsonManifest = JSON.parse(open(manifestUrl).read)
    manifestLabel = jsonManifest['label']
    results = manifestUrl + "|" + canvas_id + "|" + canvasLabel + '|' + manifestLabel
  end

  def getCanvasImageDefault canvas_id, x, y, w, h
    thumbnail = nil
    return if canvas_id == 'canvas to be named later'
    # todo: store default w & h somewhere
    w = MultispectralConfig.get("thumbnail_w") if w==0
    h = MultispectralConfig.get("thumbnail_h") if h==0
    #w = 375 if w==0
    #h = 400 if h==0
    # get canvas JSON via IIIF API in order to get the canvas_id
    @canvasUrl = SolrConnectConfig.get("canvasUrl") + canvas_id
    jsonCanvas = JSON.parse(open(@canvasUrl).read)
    imageUrl = jsonCanvas['images'][0]['resource']['default']['service']['@id'].to_s
    imageUrl += x.to_s + ','+ y.to_s + ','+ w.to_s + ','+ h.to_s
    imageUrl += '/full/0/native.jpg'
    thumbnail = open(imageUrl).read
  end


  def getAnnotationList canvas_id, x, y
    annotationListUrl = SolrConnectConfig.get("canvasUrl") + canvas_id
    annotationListUrl += '/search?region='
    tag_surround_w = MultispectralConfig.get("tag_surround_w")
    tag_surround_h = MultispectralConfig.get("tag_surround_h")
    annotationListUrl += x.to_s + ',' + y.to_s + ',12000,12000'
    #annotationListUrl += x.to_s + ',' + y.to_s + ',#' + tag_surround_w + ',' + tag_surround_h + "'"
    p 'annotationListUrl = ' + annotationListUrl
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
        p "createTagSet: #{term}"
      end
    end
    tagSet
  end
end