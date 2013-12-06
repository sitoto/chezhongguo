# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user, :class => 'Admin::User' do
    login "MyString"
    name "MyString"
    location "MyString"
    location_id 1
    bio "MyString"
    website "MyString"
    company "MyString"
    weibo "MyString"
    qq "MyString"
    email "MyString"
    email_public false
    sign_in_count 1
    current_sign_in_at "2012-12-19 18:59:19"
    last_sign_in_at "2012-12-19 18:59:19"
    current_sign_in_ip "MyString"
    last_sign_in_ip "MyString"
  end
end
