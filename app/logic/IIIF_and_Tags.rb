require "JSON"
require 'open-uri'

module IIIF_and_Tags
=begin
	- retrieve canvas:
		- lookup canvas id in lookup table based on sample .msa filename
			- store canvas_id for multispectral_sample model
		 - use canvas_id to construct url for API service:
			http://manifests.ydc2.yale.edu/canvas/3f7e4ab6-b4ea-4275-af45-2f62c9a55c43-msi
		- canvas has [‘within’] key with the manifest urtl as the value
			- store manifest url for multispectral_sample model

				logic/getManifestCanvasInfo(msaFileName): will get canvas_id from table, get canvas JSON and get manifestUrl
=end

  def getCanvas exrFileName
    # lookup canvas_id via filename_canvas_lookup
    fileName = exrFileName.gsub!('.exr', '')
    # todo: validate assumption of finding by starts_with
    canvasLookup = CanvasLookup.where("object_file_id LIKE ?", "#{fileName}%").first
    canvas_id = canvasLookup.canvas_id

    # get canvas JSON via IIIF API in order to get the manifest url
    # todo: put this in an environment variable and config
    getManifestUrl = 'http://manifests.ydc2.yale.edu/canvas/' + canvas_id
    jsonCanvas = JSON.parse(open(getManifestUrl).read)
    manifestUrl = jsonCanvas['within'][0]
    results = manifestUrl + "|" + canvas_id
  end

  def getAnnotationList canvas_id
    ge4tAnnotationUrl = 'http://manifests.ydc2.yale.edu/canvas/' + canvas_id
3f7e4ab6-b4ea-4275-af45-2f62c9a55c43-msi
/search?region=1,1,12000,12000'
  end

end