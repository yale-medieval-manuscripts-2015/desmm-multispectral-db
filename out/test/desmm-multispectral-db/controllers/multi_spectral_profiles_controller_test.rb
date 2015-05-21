require 'test_helper'

class MultiSpectralProfilesControllerTest < ActionController::TestCase
  setup do
    @multi_spectral_profile = multi_spectral_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multi_spectral_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multi_spectral_profile" do
    assert_difference('MultiSpectralProfile.count') do
      post :create, multi_spectral_profile: { BandRanges: @multi_spectral_profile.BandRanges, NumBands: @multi_spectral_profile.NumBands, notes: @multi_spectral_profile.notes, profileId: @multi_spectral_profile.profileId }
    end

    assert_redirected_to multi_spectral_profile_path(assigns(:multi_spectral_profile))
  end

  test "should show multi_spectral_profile" do
    get :show, id: @multi_spectral_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multi_spectral_profile
    assert_response :success
  end

  test "should update multi_spectral_profile" do
    patch :update, id: @multi_spectral_profile, multi_spectral_profile: { BandRanges: @multi_spectral_profile.BandRanges, NumBands: @multi_spectral_profile.NumBands, notes: @multi_spectral_profile.notes, profileId: @multi_spectral_profile.profileId }
    assert_redirected_to multi_spectral_profile_path(assigns(:multi_spectral_profile))
  end

  test "should destroy multi_spectral_profile" do
    assert_difference('MultiSpectralProfile.count', -1) do
      delete :destroy, id: @multi_spectral_profile
    end

    assert_redirected_to multi_spectral_profiles_path
  end
end
