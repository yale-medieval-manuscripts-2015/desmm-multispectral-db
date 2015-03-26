require 'rails_helper'

RSpec.describe "multi_spec_tags/edit", :type => :view do
  before(:each) do
    @multi_spec_tag = assign(:multi_spec_tag, MultiSpecTag.create!(
      :multi_spec_sample_id => "MyString",
      :Tag => "MyString",
      :TagValue => "MyString",
      :upload_status => "MyString"
    ))
  end

  it "renders the edit multi_spec_tag form" do
    render

    assert_select "form[action=?][method=?]", multi_spec_tag_path(@multi_spec_tag), "post" do

      assert_select "input#multi_spec_tag_multi_spec_sample_id[name=?]", "multi_spec_tag[multi_spec_sample_id]"

      assert_select "input#multi_spec_tag_Tag[name=?]", "multi_spec_tag[Tag]"

      assert_select "input#multi_spec_tag_TagValue[name=?]", "multi_spec_tag[TagValue]"

      assert_select "input#multi_spec_tag_upload_status[name=?]", "multi_spec_tag[upload_status]"
    end
  end
end
