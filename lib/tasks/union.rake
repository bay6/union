namespace :union do
  desc "restart union unicorn server"
  task :restart => :environment do
    `ps aux | grep unicorn | grep -v grep | awk '{print $2}' | xargs kill -9`
    puts 'stoped unicorn'
    `bundle exec unicorn_rails -c config/unicorn.rb -D -E production`
    puts 'started unicorn'
  end

  desc "backup database of union server"
  task :backup_db do
    `mysqldump -h localhost -u root -p databasepassword database | gzip > mysql-backup.sql.gz`
  end

end
