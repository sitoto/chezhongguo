# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_car_model, :class => 'Admin::CarModel' do
    name "MyString"
    name_pinyin "MyString"
    price_low "MyString"
    price_top "MyString"
    status "MyString"
    country "MyString"
    summary "MyString"
    type ""
    use "MyString"
  end
end
