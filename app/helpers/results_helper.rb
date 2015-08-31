require "IIIF_and_Tags.rb"
include IIIF_and_Tags

module ResultsHelper

  def render_jpeg_via_IIIF sample
    thumbnail = getCanvasImageDefault(sample.canvas, sample.x, sample.y, 0, 0)
    return if thumbnail.nil?
    encoded_string = Base64.encode64(thumbnail)
    src = "data:image/png;base64," + encoded_string
    html = "<img src='#{src}' alt='Wheres_my_image?'></img>"
    html.html_safe
  end

  def render_barchart (sample)
    encoded_string = Base64.encode64(sample.multispectral_barchart.barchart_png_image)
    src = "data:image/png;base64," + encoded_string
    html = "<img src='#{src}' alt='Wheres_my_barchart?'></img>"
    html.html_safe
  end

end