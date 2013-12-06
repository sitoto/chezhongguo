# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_brand, :class => 'Admin::Brand' do
    name "MyString"
    name_pinyin "MyString"
    brand_summary "MyString"
    logo_summary "MyString"
    country "MyString"
  end
end
