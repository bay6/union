set :branch, "master"
set :rails_env, "production"
server "198.199.86.44", :app, :web, :db, primary: true
