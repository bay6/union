# encoding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# admin
user = User.find_or_create_by_name_and_email("admin", "admin@example.com",
                                             :password => 'password')
user.admin = true
user.save(validate:false)

# grade
Grade.find_or_create_by_name("初级", :weights => 2)
Grade.find_or_create_by_name("中级", :weights => 4)
Grade.find_or_create_by_name("高级", :weights => 8)
