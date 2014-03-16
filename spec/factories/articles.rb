# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    mytitle "MyString"
    mydescription "MyString"
    tags ""
    only_author false
    published false
    title "MyString"
    author "MyString"
    class_name "MyString"
    first_time "MyString"
    last_time "MyString"
    from_name "MyString"
    from_url "MyString"
    last_url "MyString"
    from_ip "MyString"
    status 1
    pages_count 1
    words_count "MyString"
    like_count 1
    hits 1
  end
end
