require "IIIF_and_Tags.rb"
include IIIF_and_Tags

module BrowseHelper

  def render_jpeg_via_IIIF sample
    thumbnail = getCanvasImageDefault(sample.canvas, sample.x, sample.y, 0, 0)
    return if thumbnail.nil?
    encoded_string = Base64.encode64(thumbnail)
    src = "data:image/png;base64," + encoded_string
    html = "<img src='#{src}' alt='Wheres_my_image?' height='100' width='120'></img>"
    html.html_safe
  end

  def render_barchart (sample)
    encoded_string = Base64.encode64(sample.multispectral_barchart.barchart_png_image)
    src = "data:image/png;base64," + encoded_string
    height = MultispectralConfig.get("render_barchart_height")
    width = MultispectralConfig.get("render_barchart_width")

    #html = "<img src='#{src}' alt='Wheres_my_barchart?' height='125' width='150'></img>"
    html = "<img src='#{src}' alt='Wheres_my_barchart?' height='#{height}' width='#{width}'></img>"
    html.html_safe
  end

  def render_metadata (sample)
    bar = sample.multispectral_barchart

    md = '<b>Manifest:</b> ' + sample.manifest + '<br>'
    md += '<b>Canvas:</b> ' + sample.canvas + '<br>'
    md += '<b>png file:</b> ' + bar.barchart_png_filename + '<br>'
    md += '<b>x,y:</b> ' + sample.x.to_s + ', ' + sample.y.to_s+ '<br>'
    md += '<b>created by:</b>' + sample.user + '<br>' if !sample.user.nil?
    date = sample.created_at
    date = sample.updated_at if sample.updated_at > sample.created_at
    md += '<b>date:</b>' + date.to_s + '<br>'
    md += '<b>comment:</b>' + sample.comment + '<br>'
    #md += '<b>created by:</b>' + sample.user + '<br>'
    html = "<td><pre>#{md}</pre></td>"
    html.html_safe
  end

end