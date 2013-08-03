namespace :github do
  desc "fetch all commit in all repositories under bay6"
  task :fetch_scores => :environment do
    Commit.fetch_bay6
    User.update_all_scores
  end

  desc "fetch all repo from bay6"
  task :fetch_repos => :environment do
    Project.get_bay6_repos
    Repository.get_bay6_repos
    Project.all.each{|p| Repository.find_by_name(p.name).update_column('project_id', p.id)}
  end
end
