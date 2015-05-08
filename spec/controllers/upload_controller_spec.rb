require 'rails_helper'
require 'spec_helper'
require 'canvas_lookup.rb'

RSpec.describe UploadController, :type => :controller do

  before :each do
    @msaFile = fixture_file_upload('test.msa', 'application/octet-stream')
    @pngFile = fixture_file_upload('test.png', 'image/png')
  end

  describe "POST createFromJson" do
    before do
      @msaJsonString = '{"originalImage" :  "ellesmere_6v.exr",
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
    end

    it "creates a new MultispectralSample" do
      expect {mapHyper3dJsonToModel @msaJsonString}.to change(MultispectralSample, :count).by(1)
    end
    it "creates a new BarChart" do
      expect {mapHyper3dJsonToModel @msaJsonString}.to change(MultispectralBarchart, :count).by(1)
    end
    it "creates 8 new MultiSpecValue" do
      expect {mapHyper3dJsonToModel @msaJsonString}.to change(MultispectralValue, :count).by(8)
    end
    it "changes the count of MultipecTags" do
      expect {mapHyper3dJsonToModel @msaJsonString}.to change(MultispectralTag, :count)
    end
  end

  describe "POST uploadFile msa file" do
    before :each do
      @file = Hash.new
      @file['datafile'] = @msaFile
    end

    it "reads the file specified in the params" do
      post :uploadFile, :upload => @file
      expect(response).to redirect_to('multi_spectral_samples#index')
    end
    it "assigns the type to content_type" do
      post :uploadFile, :upload => @file
      expect(assigns(:content_type)).to eq 'application/octet-stream'
    end
    it "assigns the type to content_type" do
      post :uploadFile, :upload => @file
      expect(assigns(:file_name)).to eq 'test.msa'
    end
  end

  describe "POST uploadFile png file" do
    before :each do
      @file = Hash.new
      @file['datafile'] = @pngFile
    end

    it "reads the file specified in the params" do
      post :uploadFile, :upload => @file
      expect(response).to redirect_to('multi_spectral_samples#index')
    end
    it "assigns the type to content_type" do
      post :uploadFile, :upload => @file
      expect(assigns(:content_type)).to eq 'image/png'
    end
    it "assigns the type to content_type" do
      post :uploadFile, :upload => @file
      expect(assigns(:file_name)).to eq 'test.png'
    end
  end

end
