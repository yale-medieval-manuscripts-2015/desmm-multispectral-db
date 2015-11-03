# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    uid                 "jasper99"
    email               "jasper99@yale.edu"
    password             "password"
    encrypted_password  "7KVcbLRkKU15XiCRlTGuj0raudw+pl+SaGVnm456LoE"
    provider            "cas"
    sign_in_count       "0"
    name                "Jasper"
    factory :jasper99
  end
end



