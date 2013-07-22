source 'https://rubygems.org'
#source 'http://ruby.taobao.org'

gem 'mysql2'
gem 'rails', '3.2.13'
gem "slim-rails"
gem "kaminari"
gem "less-rails"
gem "devise"
gem "cancan"
gem "simple_form"
gem "client_side_validations"
gem "client_side_validations-simple_form"
gem "rails-i18n"
gem "devise-i18n"
gem "devise-i18n-views", :git => "https://github.com/mcasimir/devise-i18n-views.git"
gem "mini_magick"
gem 'omniauth-github'
gem 'octokit'
gem 'rest-client'
gem 'rack-mini-profiler'
gem 'dalli'
gem 'whenever', :require => false
gem 'delayed_job_active_record'
gem 'lazy_high_charts'
gem 'newrelic_rpm'
gem 'inherited_resources'
gem 'redcarpet'
gem 'jquery-ui-rails'

group :assets do
  gem "twitter-bootstrap-rails"
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem "turbo-sprockets-rails3"
  gem 'therubyracer', :platforms => :ruby
end

group :development, :test do
  gem "thin"
  gem 'pry-nav'
  gem 'pry-debugger'
  gem 'pry-rails'
  gem "awesome_print"
  gem "quiet_assets"
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
  gem "capistrano"
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'simplecov', require: false
end

group :production do
  gem 'pg'
  gem 'exception_notification'
  gem 'unicorn', :platforms => :ruby
end
