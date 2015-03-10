require 'test_helper'

class MultiSpecValuesControllerTest < ActionController::TestCase
  setup do
    @multi_spec_value = multi_spec_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multi_spec_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multi_spec_value" do
    assert_difference('MultiSpecValue.count') do
      post :create, multi_spec_value: { MultiSpecSample_id: @multi_spec_value.MultiSpecSample_id, range: @multi_spec_value.range, value: @multi_spec_value.value }
    end

    assert_redirected_to multi_spec_value_path(assigns(:multi_spec_value))
  end

  test "should show multi_spec_value" do
    get :show, id: @multi_spec_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multi_spec_value
    assert_response :success
  end

  test "should update multi_spec_value" do
    patch :update, id: @multi_spec_value, multi_spec_value: { MultiSpecSample_id: @multi_spec_value.MultiSpecSample_id, range: @multi_spec_value.range, value: @multi_spec_value.value }
    assert_redirected_to multi_spec_value_path(assigns(:multi_spec_value))
  end

  test "should destroy multi_spec_value" do
    assert_difference('MultiSpecValue.count', -1) do
      delete :destroy, id: @multi_spec_value
    end

    assert_redirected_to multi_spec_values_path
  end
end
