namespace :github do
  desc "fetch all commit in all repositories under bay6"
  task :fetch_scores => :environment do
    Commit.fetch_bay6
    User.update_all_scores
  end

end
