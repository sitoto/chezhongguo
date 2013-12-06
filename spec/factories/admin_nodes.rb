# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_node, :class => 'Admin::Node' do
    name "MyString"
    summary "MyString"
    sort 1
    questions_count 1
  end
end
