require "bundler/setup"
require 'capistrano/ext/multistage'
load 'deploy/assets'

set :stages, %w(production staging)
set :default_stage, "production"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "union"
set :repository,  "https://github.com/bay6/union.git"
set :scm, :git
set :user, "bay6"
set :runner, "bay6"
set :deploy_to, "/home/bay6/rails_apps/#{application}"
#set :deploy_via, :remote_cache
set :use_sudo, false
set :use_19, "rbenv local 1.9.3-p448"
set :ruby_version, "1.9.3-p448"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
default_environment['PATH'] = "/home/bay6/.rbenv/bin:/home/bay6/.rbenv/shims:$PATH"


namespace :db do
  task :create_db_symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/system/database.yml #{release_path}/config/database.yml"
  end
end

before "deploy:assets:precompile", "db:create_db_symlink"
after "deploy", "deploy:cleanup"
