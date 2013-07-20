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
Grade.find_or_create_by_name("无业游民", :weights => 1)
Grade.find_or_create_by_name("初级", :weights => 2)
Grade.find_or_create_by_name("中级", :weights => 4)
Grade.find_or_create_by_name("高级", :weights => 8)

# project init
@client = Octokit::Client.new(:login => "ken0", :password => "password9")
brepos = @client.repos( 'bay6')
brepos.each do |repo|
  p = Project.find_or_create_by_name(repo.name,
                                 :website => repo.html_url,
                                 :description => repo.description,
                                 :grade_id => 1,
                                 :user_id => 1,
                                 :status => Project::ONGOING
                                )
  p.save! :validate => false
end

Repository.get_bay6_repos

Project.all.each{|p| Repository.find_by_name(p.name).update_column('project_id', p.id)}

Participation.all.each{|p|p.update_column('created_at', 30.days.ago)}
