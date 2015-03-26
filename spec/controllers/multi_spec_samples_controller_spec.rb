require 'rails_helper'
require 'json'

RSpec.describe MultiSpecSamplesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # MultiSpecSample. As you add validations to MultiSpecSample, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    #skip("Add a hash of attributes valid for your model")
    {multi_spec_sample_id: 'ellesmere.exr_320_718', manifest: 'updated_manifest_name',x: 320, y: 718}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MultiSpecSamplesController. Be sure to keep this updated too.
  let(:valid_session) { {whatever: 'whatever'} }

  describe "GET index" do
    it "assigns all multi_spec_samples as @multi_spec_samples" do
      multi_spec_sample = MultiSpecSample.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:multi_spec_samples)).to eq([multi_spec_sample])
    end
  end

  describe "GET show" do
    it "assigns the requested multi_spec_sample as @multi_spec_sample" do
      multi_spec_sample = MultiSpecSample.create! valid_attributes
      get :show, {:id => multi_spec_sample.to_param}, valid_session
      expect(assigns(:multi_spec_sample)).to eq(multi_spec_sample)
    end
  end

  describe "GET new" do
    it "assigns a new multi_spec_sample as @multi_spec_sample" do
      get :new, {}, valid_session
      expect(assigns(:multi_spec_sample)).to be_a_new(MultiSpecSample)
    end
  end

  describe "GET edit" do
    it "assigns the requested multi_spec_sample as @multi_spec_sample" do
      multi_spec_sample = MultiSpecSample.create! valid_attributes
      get :edit, {:id => multi_spec_sample.to_param}, valid_session
      expect(assigns(:multi_spec_sample)).to eq(multi_spec_sample)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MultiSpecSample" do
        expect {
          post :create, {:multi_spec_sample => valid_attributes}, valid_session
        }.to change(MultiSpecSample, :count).by(1)
      end

      it "assigns a newly created multi_spec_sample as @multi_spec_sample" do
        post :create, {:multi_spec_sample => valid_attributes}, valid_session
        expect(assigns(:multi_spec_sample)).to be_a(MultiSpecSample)
        expect(assigns(:multi_spec_sample)).to be_persisted
      end

      it "redirects to the created multi_spec_sample" do
        post :create, {:multi_spec_sample => valid_attributes}, valid_session
        expect(response).to redirect_to(MultiSpecSample.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved multi_spec_sample as @multi_spec_sample" do
        post :create, {:multi_spec_sample => invalid_attributes}, valid_session
        expect(assigns(:multi_spec_sample)).to be_a_new(MultiSpecSample)
      end

      it "re-renders the 'new' template" do
        post :create, {:multi_spec_sample => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST createFromJson" do
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
    ms_json = JSON.parse(exrJsonString)
    # change below to post once with multiple expectations
    describe "createFromJson" do
      it "creates a new MultiSpecSample" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultiSpecSample, :count).by(1)
      end
      it "creates a new BarChart" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultiSpecBarChart, :count).by(1)
      end
      it "creates 8 new MultiSpecValue" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultiSpecValue, :count).by(8)
      end
      it "changes the count of MultipecTags" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultiSpecTag, :count)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested multi_spec_sample" do
        multi_spec_sample = MultiSpecSample.create! valid_attributes
        put :update, {:id => multi_spec_sample.to_param, :multi_spec_sample => new_attributes}, valid_session
        multi_spec_sample.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested multi_spec_sample as @multi_spec_sample" do
        multi_spec_sample = MultiSpecSample.create! valid_attributes
        put :update, {:id => multi_spec_sample.to_param, :multi_spec_sample => valid_attributes}, valid_session
        expect(assigns(:multi_spec_sample)).to eq(multi_spec_sample)
      end

      it "redirects to the multi_spec_sample" do
        multi_spec_sample = MultiSpecSample.create! valid_attributes
        put :update, {:id => multi_spec_sample.to_param, :multi_spec_sample => valid_attributes}, valid_session
        expect(response).to redirect_to(multi_spec_sample)
      end
    end

    describe "with invalid params" do
      it "assigns the multi_spec_sample as @multi_spec_sample" do
        multi_spec_sample = MultiSpecSample.create! valid_attributes
        put :update, {:id => multi_spec_sample.to_param, :multi_spec_sample => invalid_attributes}, valid_session
        expect(assigns(:multi_spec_sample)).to eq(multi_spec_sample)
      end

      it "re-renders the 'edit' template" do
        multi_spec_sample = MultiSpecSample.create! valid_attributes
        put :update, {:id => multi_spec_sample.to_param, :multi_spec_sample => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested multi_spec_sample" do
      multi_spec_sample = MultiSpecSample.create! valid_attributes
      expect {
        delete :destroy, {:id => multi_spec_sample.to_param}, valid_session
      }.to change(MultiSpecSample, :count).by(-1)
    end

    it "redirects to the multi_spec_samples list" do
      multi_spec_sample = MultiSpecSample.create! valid_attributes
      delete :destroy, {:id => multi_spec_sample.to_param}, valid_session
      expect(response).to redirect_to(multi_spec_samples_url)
    end
  end

end