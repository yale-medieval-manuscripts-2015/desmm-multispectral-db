require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe MultiSpectralSamplesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # MultiSpecSample. As you add validations to MultiSpecSample, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MultiSpectralSamplesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all multi_spectral_samples as @multi_spectral_samples" do
      multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:multi_spectral_samples)).to eq([multi_spectral_sample])
    end
  end

  describe "GET show" do
    it "assigns the requested multi_spectral_sample as @multi_spectral_sample" do
      multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      get :show, {:id => multi_spectral_sample.to_param}, valid_session
      expect(assigns(:multi_spectral_sample)).to eq(multi_spectral_sample)
    end
  end

  describe "GET new" do
    it "assigns a new multi_spectral_sample as @multi_spectral_sample" do
      get :new, {}, valid_session
      expect(assigns(:multi_spectral_sample)).to be_a_new(MultiSpectralSample)
    end
  end

  describe "GET edit" do
    it "assigns the requested multi_spectral_sample as @multi_spectral_sample" do
      multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      get :edit, {:id => multi_spectral_sample.to_param}, valid_session
      expect(assigns(:multi_spectral_sample)).to eq(multi_spectral_sample)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MultiSpectralSample" do
        expect {
          post :create, {:multi_spectral_sample => valid_attributes}, valid_session
        }.to change(MultiSpectralSample, :count).by(1)
      end

      it "assigns a newly created multi_spectral_sample as @multi_spectral_sample" do
        post :create, {:multi_spectral_sample => valid_attributes}, valid_session
        expect(assigns(:multi_spectral_sample)).to be_a(MultiSpectralSample)
        expect(assigns(:multi_spectral_sample)).to be_persisted
      end

      it "redirects to the created multi_spectral_sample" do
        post :create, {:multi_spectral_sample => valid_attributes}, valid_session
        expect(response).to redirect_to(MultiSpectralSample.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved multi_spectral_sample as @multi_spectral_sample" do
        post :create, {:multi_spectral_sample => invalid_attributes}, valid_session
        expect(assigns(:multi_spectral_sample)).to be_a_new(MultiSpectralSample)
      end

      it "re-renders the 'new' template" do
        post :create, {:multi_spectral_sample => invalid_attributes}, valid_session
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
      it "creates a new MultispectralSample" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultispectralSample, :count).by(1)
      end
      it "creates a new BarChart" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultispectralBarChart, :count).by(1)
      end
      it "creates 8 new MultiSpecValue" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultispectralValue, :count).by(8)
      end
      it "changes the count of MultipecTags" do
        expect {post :createFromJson, ms_json: exrJsonString}.to change(MultispectralTag, :count)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested multi_spectral_sample" do
        multi_spectral_sample = MultiSpectralSample.create! valid_attributes
        put :update, {:id => multi_spectral_sample.to_param, :multi_spectral_sample => new_attributes}, valid_session
        multi_spectral_sample.reload
        skip("Add assertions for updated state")
      end

      #it "assigns the requested multi_spectral_sample as @multi_spectral_sample" do
      #  multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      #  put :update, {:id => multi_spectral_sample.to_param, :multi_spectral_sample => valid_attributes}, valid_session
      #  expect(assigns(:multi_spectral_sample)).to eq(multi_spectral_sample)
      #end

      #it "redirects to the multi_spectral_sample" do
      #  multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      #  put :update, {:id => multi_spectral_sample.to_param, :multi_spectral_sample => valid_attributes}, valid_session
      #  expect(response).to redirect_to(multi_spectral_sample)
      #end
    end

    describe "with invalid params" do
      it "assigns the multi_spectral_sample as @multi_spectral_sample" do
        multi_spectral_sample = MultiSpectralSample.create! valid_attributes
        put :update, {:id => multi_spectral_sample.to_param, :multi_spectral_sample => invalid_attributes}, valid_session
        expect(assigns(:multi_spectral_sample)).to eq(multi_spectral_sample)
      end

      it "re-renders the 'edit' template" do
        multi_spectral_sample = MultiSpectralSample.create! valid_attributes
        put :update, {:id => multi_spectral_sample.to_param, :multi_spectral_sample => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested multi_spectral_sample" do
      multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      expect {
        delete :destroy, {:id => multi_spectral_sample.to_param}, valid_session
      }.to change(MultiSpectralSample, :count).by(-1)
    end

    it "redirects to the multi_spectral_samples list" do
      multi_spectral_sample = MultiSpectralSample.create! valid_attributes
      delete :destroy, {:id => multi_spectral_sample.to_param}, valid_session
      expect(response).to redirect_to(multi_spectral_samples_url)
    end
  end

end
