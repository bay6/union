namespace :github do
  desc "fetch all commit in all repositories under bay6"
  task :fetch_bay6_commits => :environment do
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
    @client.repos('bay6').each { |r| Commit.get_commit_from r }
  end

end
