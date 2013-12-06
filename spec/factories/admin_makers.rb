# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_maker, :class => 'Admin::Maker' do
    name "MyString"
    name_pinyin "MyString"
    summary "MyString"
    site "MyString"
  end
end
