require 'test_helper'

class MultiSpecTagsControllerTest < ActionController::TestCase
  setup do
    @multi_spec_tag = multi_spec_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multi_spec_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multi_spec_tag" do
    assert_difference('MultiSpecTag.count') do
      post :create, multi_spec_tag: { : @multi_spec_tag., : @multi_spec_tag., : @multi_spec_tag., MultiSpecSample_id: @multi_spec_tag.MultiSpecSample_id, Tag: @multi_spec_tag.Tag, TagValue: @multi_spec_tag.TagValue }
    end

    assert_redirected_to multi_spec_tag_path(assigns(:multi_spec_tag))
  end

  test "should show multi_spec_tag" do
    get :show, id: @multi_spec_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multi_spec_tag
    assert_response :success
  end

  test "should update multi_spec_tag" do
    patch :update, id: @multi_spec_tag, multi_spec_tag: { : @multi_spec_tag., : @multi_spec_tag., : @multi_spec_tag., MultiSpecSample_id: @multi_spec_tag.MultiSpecSample_id, Tag: @multi_spec_tag.Tag, TagValue: @multi_spec_tag.TagValue }
    assert_redirected_to multi_spec_tag_path(assigns(:multi_spec_tag))
  end

  test "should destroy multi_spec_tag" do
    assert_difference('MultiSpecTag.count', -1) do
      delete :destroy, id: @multi_spec_tag
    end

    assert_redirected_to multi_spec_tags_path
  end
end
