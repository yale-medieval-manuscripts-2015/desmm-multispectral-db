require 'rails_helper'

RSpec.describe "multi_spec_samples/edit", :type => :view do
  before(:each) do
    @multi_spec_sample = assign(:multi_spec_sample, MultiSpecSample.create!(
      :multi_spec_sample_id => "MyString",
      :manifest => "MyString",
      :canvas => "MyString",
      :x => 1,
      :y => 1,
      :creatingApplication => "MyString",
      :comment => "MyText",
      :exrFileName => "MyString",
      :user => "MyString",
      :profileID => 1,
      :upload_status => "MyString"
    ))
  end

  it "renders the edit multi_spec_sample form" do
    render

    assert_select "form[action=?][method=?]", multi_spec_sample_path(@multi_spec_sample), "post" do

      assert_select "input#multi_spec_sample_multi_spec_sample_id[name=?]", "multi_spec_sample[multi_spec_sample_id]"

      assert_select "input#multi_spec_sample_manifest[name=?]", "multi_spec_sample[manifest]"

      assert_select "input#multi_spec_sample_canvas[name=?]", "multi_spec_sample[canvas]"

      assert_select "input#multi_spec_sample_x[name=?]", "multi_spec_sample[x]"

      assert_select "input#multi_spec_sample_y[name=?]", "multi_spec_sample[y]"

      assert_select "input#multi_spec_sample_creatingApplication[name=?]", "multi_spec_sample[creatingApplication]"

      assert_select "textarea#multi_spec_sample_comment[name=?]", "multi_spec_sample[comment]"

      assert_select "input#multi_spec_sample_exrFileName[name=?]", "multi_spec_sample[exrFileName]"

      assert_select "input#multi_spec_sample_user[name=?]", "multi_spec_sample[user]"

      assert_select "input#multi_spec_sample_profileID[name=?]", "multi_spec_sample[profileID]"

      assert_select "input#multi_spec_sample_upload_status[name=?]", "multi_spec_sample[upload_status]"
    end
  end
end
