require "IIIF_and_Tags.rb"
include IIIF_and_Tags

module ResultsHelper

  def render_jpeg_via_IIIF sample
    src=''
    #html = "<img src='#{src}' alt=''></img>"
    return if sample.manifest == 'manifest to be named later'
    thumbnail = getCanvasImageDefault(sample.canvas, sample.x, sample.y, 0, 0)
    return if thumbnail.nil? || thumbnail.empty?
    encoded_string = Base64.encode64(thumbnail)
    src = "data:image/png;base64," + encoded_string
    html = "<img src='#{src}' alt=''></img>"
    html.html_safe
  end

  def render_barchart (sample)
    if !sample.multispectral_barchart.nil?
      barchart_image = sample.multispectral_barchart.barchart_png_image
    else
      barchart = MultispectralBarchart.find_by_barchart_png_filename("blank_barchart.png")
      barchart_image =barchart.barchart_png_image
    end

    encoded_string = Base64.encode64(barchart_image)
    src = "data:image/png;base64," + encoded_string
    html = "<img src='#{src}' alt=''></img>"
    html.html_safe
  end

end