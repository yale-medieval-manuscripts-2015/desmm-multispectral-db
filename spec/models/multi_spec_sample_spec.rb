require 'rails_helper'
require 'json'

RSpec.describe MultiSpecSample, :type => :model do
  describe "can write to sample and child records from exr json"
  exrJsonString = '{
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
  #exr_json = JSON.parse(exrJsonString)
  #MultiSpecSample.createWithJsonData(exr_json)
  describe "with valid params" do
    it "creates a new MultiSpecSample with tags, values and barchart models" do
      expect {
        exr_json = JSON.parse(exrJsonString)
        MultiSpecSample.createWithJsonData(exr_json)
      }.to change(MultiSpecSample, :count).by(1)
    end
  end
end
