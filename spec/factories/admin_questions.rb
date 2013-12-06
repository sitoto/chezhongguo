# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_question, :class => 'Admin::Question' do
    title "MyString"
    content "MyString"
    good 1
    bad 1
    answers_count 1
    views_count 1
    replied_at "2012-12-19 14:57:19"
    suggested_at "2012-12-19 14:57:19"
    node_name "MyString"
    who_deleted "MyString"
  end
end
