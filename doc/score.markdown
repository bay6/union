```ruby
# 1
bundle exec rake db:seed

#2
#bundle exec rails c 下跑 
Repository.get_bay6_repos

#3
bundle exec rake github:fetch_bay6_commits

#4
#(optional 用来从30天算分得)bundle exec 下跑 
Participation.all.each{|p|p.update_column('created_at', 30.days.ago)} 

#5bundle exec rails console 跑关联  
Project.all.each{|p| Repository.find_by_name(p.name).update_column('project_id', p.id)}

#6bundle exec rails console 跑分 
User.update_all_scores

```
