require 'rails_helper'
require "Hyper3dJson.rb"
include Hyper3dJson

RSpec.describe UploadController, :type => :controller do

  describe "POST createFromJson" do
    msaJsonString = '{
    "originalImage" :  "ellesmere_6v.exr",
    "spectralImage" :  "ellesmere_6v_718_1136_norm.png",
    "sampleLocation" : {
         "x":718,
         "y":1136
    },
    "samples" : {
         "wavelength" :  "nm",
         "reflectance" :  "",
         "normalized" :  true,
         "values" : {
              "370" : 0.0569458,
              "417" : 0.0714722,
              "475" : 0.0698242,
              "525" : 0.0556335,
              "585" : 0.0938721,
              "628" : 0.169312,
              "675" : 0.241821,
              "755" : 0.338867
         }
    },
    "creatingApplication" : {
         "name" :  "Hyper3D",
         "version" :  "....."
    },
    "comment" :  "test"
    }'

    # change below to post once with multiple expectations
    describe "createFromJson" do
      it "creates a new MultispectralSample" do
        #expect {post :uploadFile, ms_json: msaJsonString}.to change(MultispectralSample, :count).by(1)
        expect {mapHyper3dJsonToModel msaJsonString}.to change(MultispectralSample, :count).by(1)
      end
      it "creates a new BarChart" do
        expect {mapHyper3dJsonToModel msaJsonString}.to change(MultispectralBarchart, :count).by(1)
      end
      it "creates 8 new MultiSpecValue" do
        expect {mapHyper3dJsonToModel msaJsonString}.to change(MultispectralValue, :count).by(8)
      end
      it "changes the count of MultipecTags" do
        expect {mapHyper3dJsonToModel msaJsonString}.to change(MultispectralTag, :count)
      end
    end
  end

end
