#!/bin/bash
mysqldump --user=DBUSER --password=DBPWD --databases SQLDATABASE > ~/db_backup/`date +\%Y-\%m-\%d`_backup_database.sql
#0 0 * * * env RBENV_VERSION=jruby-1.6.7.2 bash -l -c 'cd /Users/kenlu/git_repo/union && RAILS_ENV=production bundle exec rake rake union:backup_db --silent >> log/cron.log 2>&1'
30 4 * * * env RBENV_VERSION=jruby-1.6.7.2 bash -l -c 'cd /Users/kenlu/git_repo/union && mysqldump --user=root --password="" --databases union_development | gzip > db/`date +\%Y-\%m-\%d`_backup_database.sql'

#how to restort

tar xzvf backup.sql.gz
