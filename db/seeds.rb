# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => '80pei',:login => '80pei', :email => 'admin@80pei.com', :password => 'bangnipei', :password_confirmation => 'bangnipei'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'bangnipei',:login => 'bangnipei', :email => 'bangnipei@80pei.com', :password => 'bangnipei', :password_confirmation => 'bangnipei'
puts 'New user created: ' << user2.name
