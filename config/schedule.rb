# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :output, 'log/cron.log'
set :rbenv_version, ENV['RBENV_VERSION']
set :job_template, "env RBENV_VERSION=#{rbenv_version} bash -l -c ':job'"

every :hour do
  #runner "Commit.fetch_bay6"
  #runner "User.update_all_scores"
  rake 'github:fetch_scores'
end
