# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :multispectral_sample do
    multispectral_sample_semantic_id "MyString"
    manifest "MyString"
    canvas "MyString"
    x 1
    y 1
    wavelength "MyString"
    reflectance "MyString"
    normalized false
    creating_application "MyString"
    creating_application_version "MyString"
    comment "MyText"
    exr_file_name "MyString"
    user "MyString"
    profile_id 1
    upload_status "MyString"
    manifest_label "MyString"
    canvas_label "MyString"
    institution "MyString"
    md_date "MyString"
    md_provenance "MyString"
    md_material "MyString"
    md_language "MyString"
  end
end
