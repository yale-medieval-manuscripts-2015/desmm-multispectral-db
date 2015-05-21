require 'test_helper'

class MultiSpecSamplesControllerTest < ActionController::TestCase
  setup do
    @multi_spec_sample = multi_spec_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multi_spec_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multi_spec_sample" do
    assert_difference('MultiSpecSample.count') do
      post :create, multi_spec_sample: { MultiSpecSample_id: @multi_spec_sample.MultiSpecSample_id, canvas: @multi_spec_sample.canvas, comment: @multi_spec_sample.comment, createdOn: @multi_spec_sample.createdOn, creatingApplication: @multi_spec_sample.creatingApplication, creatingApplication: @multi_spec_sample.creatingApplication, exrFileName: @multi_spec_sample.exrFileName, manifest: @multi_spec_sample.manifest, manifest: @multi_spec_sample.manifest, normalized: @multi_spec_sample.normalized, profileID: @multi_spec_sample.profileID, reflectance: @multi_spec_sample.reflectance, user: @multi_spec_sample.user, wavelength: @multi_spec_sample.wavelength, x: @multi_spec_sample.x, y: @multi_spec_sample.y }
    end

    assert_redirected_to multi_spec_sample_path(assigns(:multi_spec_sample))
  end

  test "should show multi_spec_sample" do
    get :show, id: @multi_spec_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multi_spec_sample
    assert_response :success
  end

  test "should update multi_spec_sample" do
    patch :update, id: @multi_spec_sample, multi_spec_sample: { MultiSpecSample_id: @multi_spec_sample.MultiSpecSample_id, canvas: @multi_spec_sample.canvas, comment: @multi_spec_sample.comment, createdOn: @multi_spec_sample.createdOn, creatingApplication: @multi_spec_sample.creatingApplication, creatingApplication: @multi_spec_sample.creatingApplication, exrFileName: @multi_spec_sample.exrFileName, manifest: @multi_spec_sample.manifest, manifest: @multi_spec_sample.manifest, normalized: @multi_spec_sample.normalized, profileID: @multi_spec_sample.profileID, reflectance: @multi_spec_sample.reflectance, user: @multi_spec_sample.user, wavelength: @multi_spec_sample.wavelength, x: @multi_spec_sample.x, y: @multi_spec_sample.y }
    assert_redirected_to multi_spec_sample_path(assigns(:multi_spec_sample))
  end

  test "should destroy multi_spec_sample" do
    assert_difference('MultiSpecSample.count', -1) do
      delete :destroy, id: @multi_spec_sample
    end

    assert_redirected_to multi_spec_samples_path
  end
end
