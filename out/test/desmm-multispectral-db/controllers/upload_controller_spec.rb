require 'rails_helper'
require 'spec_helper'

RSpec.describe UploadController, :type => :controller do

  before :each do
    @msaFile = fixture_file_upload('test.msa', 'application/octet-stream')
    @pngFile = fixture_file_upload('test.png', 'image/png')

    @canvasLookup = CanvasLookup.create(canvas_id: '4760c275-aa35-4e0f-ab5a-f180cdcf5ea3-msi', object_file_id: 'ellesmere_6v-001F5.tif')
  end

  describe "mapHyper3dJsonToModel" do
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

  context "when post is called" do
    describe "POST uploadFile msa file" do
      before :each do
        @file = Hash.new
        @file['datafile'] = @msaFile
      end
      it "reads the file specified in the params" do
        post :uploadFile, :upload => @file
        #expect(response).to redirect_to('multi_spectral_samples#index')
        expect(response.status).to eq(200)
      end
      it "assigns the type to content_type" do
        post :uploadFile, :upload => @file
        expect(assigns(:content_type)).to eq 'application/octet-stream'
      end
      it "assigns the the name correctly" do
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
        #expect(response).to redirect_to('multi_spectral_samples#index')
        expect(response.status).to eq(200)
      end
      it "assigns the type to content_type" do
        post :uploadFile, :upload => @file
        expect(assigns(:content_type)).to eq 'image/png'
      end
      it "assigns the name correctly" do
        post :uploadFile, :upload => @file
        expect(assigns(:file_name)).to eq 'test.png'
      end
    end
  end

  context 'MSA and PNG files loaded in any order:' do
    describe 'Upload MSA without matching PNG' do
      it "should create an initial barchart record with upload_status of 'image data not loaded'" do
        @file = Hash.new
        @file['datafile'] = @msaFile
        post :uploadFile, :upload => @file
        @barchart = MultispectralBarchart.last()
        expect(@barchart['upload_status']).to eq ('image data not loaded')
        expect(@barchart['barchart_png_image']).to eq ('image bytes here')
        expect(@barchart['multispectral_sample_id']).not_to eq(nil)
      end
    end

    describe 'Upload PNG without matching MSA' do
      it "should create a barchart record with upload_status of 'image data not loaded'" do
        @file = Hash.new
        @file['datafile'] = @pngFile
        post :uploadFile, :upload => @file
        @barchart = MultispectralBarchart.last()
        expect(@barchart['upload_status']).to eq ('no parent')
        expect(@barchart['multispectral_sample_id']).to eq(nil)
      end
    end

    describe 'Upload MSA first, then matching PNG' do
      it "should create a barchart record with upload_status of 'image data not loaded'" do
        @file = Hash.new

        @file['datafile'] = @msaFile
        post :uploadFile, :upload => @file

        @file['datafile'] = @pngFile
        post :uploadFile, :upload => @file

        @sample = MultispectralSample.last
        expect(@sample['upload_status']).to eq ('3) complete')

        @barchart = MultispectralBarchart.last()
        expect(@barchart['barchart_png_image']).not_to eq ('image bytes here')
        expect(@barchart['multispectral_sample_id']).not_to eq(nil)
        expect(@barchart['upload_status']).to eq ('complete')
      end
    end

    describe 'Upload PNG first, then matching MSA' do
      it "should create a barchart record with upload_status of 'image data not loaded'" do
        @file = Hash.new

        @file['datafile'] = @pngFile
        post :uploadFile, :upload => @file

        @file['datafile'] = @msaFile
        post :uploadFile, :upload => @file

        @sample = MultispectralSample.last
        expect(@sample['upload_status']).to eq ('3) complete')

        @barchart = MultispectralBarchart.last()
        expect(@barchart['barchart_png_image']).not_to eq ('image bytes here')
        expect(@barchart['multispectral_sample_id']).not_to eq(nil)
        expect(@barchart['upload_status']).to eq ('complete')
      end
    end
  end

end