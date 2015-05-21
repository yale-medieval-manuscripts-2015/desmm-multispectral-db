class MultispectralConfig
  @@configuration = {}

  def self.set(property_name, value)
    @@configuration[property_name] = value
  end

  def self.get(property_name)
    @@configuration[property_name]
  end

  def self.setup
    yield self
  end

  set("profile", "1")

  set("thumbnail_w", "375")
  set("thumbnail_h", "400")

  set("render_barchart_width", "150")
  set("render_barchart_height", "125")

  set("tag_surround_h", "12000")
  set("tag_surround_w", "12000")

end