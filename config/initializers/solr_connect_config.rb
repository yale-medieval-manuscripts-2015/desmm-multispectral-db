class SolrConnectConfig
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

    tagSetUrl = ENV['DESMM_TAG_SET_URL']
    set("tagSetUrl", tagSetUrl)

    canvasUrl = ENV['CANVAS_URL']
    set("canvasUrl", canvasUrl)

    annotationListUrl = ENV['ANNOTATION_LIST_URL']
    set("annotationListUrl", annotationListUrl)

  end
