require 'test_helper'

class MultiSpecBarChartsControllerTest < ActionController::TestCase
  setup do
    @multi_spec_bar_chart = multi_spec_bar_charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multi_spec_bar_charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multi_spec_bar_chart" do
    assert_difference('MultiSpecBarChart.count') do
      post :create, multi_spec_bar_chart: { MultiSpecSample_id: @multi_spec_bar_chart.MultiSpecSample_id, bar: @multi_spec_bar_chart.bar, barchart_png_filespec: @multi_spec_bar_chart.barchart_png_filespec, chart_png_image: @multi_spec_bar_chart.chart_png_image }
    end

    assert_redirected_to multi_spec_bar_chart_path(assigns(:multi_spec_bar_chart))
  end

  test "should show multi_spec_bar_chart" do
    get :show, id: @multi_spec_bar_chart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multi_spec_bar_chart
    assert_response :success
  end

  test "should update multi_spec_bar_chart" do
    patch :update, id: @multi_spec_bar_chart, multi_spec_bar_chart: { MultiSpecSample_id: @multi_spec_bar_chart.MultiSpecSample_id, bar: @multi_spec_bar_chart.bar, barchart_png_filespec: @multi_spec_bar_chart.barchart_png_filespec, chart_png_image: @multi_spec_bar_chart.chart_png_image }
    assert_redirected_to multi_spec_bar_chart_path(assigns(:multi_spec_bar_chart))
  end

  test "should destroy multi_spec_bar_chart" do
    assert_difference('MultiSpecBarChart.count', -1) do
      delete :destroy, id: @multi_spec_bar_chart
    end

    assert_redirected_to multi_spec_bar_charts_path
  end
end
