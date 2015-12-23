#require "rubygems"
#require "JSON"
require 'open-uri'

module IIIF_and_Tags

  def getCanvas exrFileName
    # lookup canvas_id via filename_canvas_lookup
    fileName = exrFileName.gsub!('.exr', '')
    canvasLookup = CanvasLookup.where("object_file_id LIKE ?", "#{fileName}%").first
    if canvasLookup.nil? || canvasLookup.empty?
      results = ""
      return
    end
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
    if @canvasUrl.nil? || @canvasUrl.empty?
      return
    end
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
    #p 'annotationListUrl = ' + annotationListUrl
    jsonAnnotationList = JSON.parse(open(annotationListUrl).read)
    jsonResources = jsonAnnotationList['resources'] # Returns array
  end

  # use annotation_list to build unique tagset
  def createTagSet resources, x, y
    tagSet = Set.new
    resources.each do | resource |
      #does this annotation contain the pixel we want?
      if annotation_contains_pixel resource['on'], x,y
       # p "******* resource_on = #{resource['on']} contains pixel"
        chars = resource['resource']['chars']
        terms = chars.split(' ')
        terms.each do |term|
          tagSet.add term if term.start_with?('#')
          #p "createTagSet: #{term}"
          end
      end
    end
    tagSet
  end

  def annotation_contains_pixel resource_on, sample_x, sample_y
    annotation_contains_pixel= false
    xywhStr = (resource_on.match /(?<==).*/).to_s
    xywh = xywhStr.split(",").map { |s| s.to_i }
    x1 = xywh[0]
    y1 = xywh[1]
    w = xywh[2]
    h = xywh[3]
    x2 = x1 + w
    y2 = y1 + h
    annotation_contains_pixel = true if sample_x >= x1 && sample_x <= x2 && sample_y >= y1 && sample_y <= y2
=begin
    p "sample_x = #{sample_x}"
    p "sample_y = #{sample_y}"
    p "xywh = #{xywhStr}"
    p "x1 = #{x1}"
    p "y1 = #{y1}"
    p "w = #{w}"
    p "h = #{h}"
    p "x2 = #{x2}"
    p "y2 = #{y2}"
    p "annotation_contains_pixel = #{annotation_contains_pixel.to_s}"
=end
    return annotation_contains_pixel
  end

end