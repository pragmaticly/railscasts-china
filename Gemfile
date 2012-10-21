require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://rubygems.org'

gem 'rails', git: 'git://github.com/rails/rails.git'
gem 'activerecord-deprecated_finders', git: 'git://github.com/rails/activerecord-deprecated_finders.git'
gem 'journey', git: 'git://github.com/rails/journey.git'
gem 'strong_parameters'
gem 'mysql2'

group :assets do
  gem 'sass-rails',  git: 'git://github.com/rails/sass-rails.git'
  gem 'coffee-rails', git: 'git://github.com/rails/coffee-rails.git'
  gem 'uglifier', '~> 1.2.4'
  gem 'execjs'
end

gem 'jquery-rails'
gem "omniauth", ">= 1.1.0"
gem "omniauth-github"
gem "bootstrap-sass", ">= 2.0.3"
gem "airbrake"
gem "puma"
gem "coderay"
gem "kaminari"
gem "redcarpet"

# Deploy with Capistrano
gem 'capistrano', "2.13.4"
gem 'capistrano-ext'

# File Uploading
gem 'carrierwave'

# Comment Tree Structure
gem 'ancestry'
gem 'gravatar_image_tag'

group :development, :test do
  gem "rspec-rails", ">= 2.10.1"
  gem "factory_girl_rails", ">= 3.3.0"
  gem "shoulda-matchers"
  gem "rspec-instafail"
  gem "capybara"
end

group :development do
  gem "debugger"
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"

  #case HOST_OS
  #  when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
  #  when /linux/i
  #    gem 'libnotify'
  #    gem 'rb-inotify'
  #  when /mswin|windows/i
  #    gem 'rb-fchange'
  #    gem 'win32console'
  #    gem 'rb-notifu'
  # end
  gem "annotate", '~> 2.4.1.beta1'
  gem 'guard-annotate'
  gem "rails_best_practices"
  gem 'foreman'
end

group :test do
  gem "email_spec", ">= 1.2.1"
  gem 'simplecov', :require => false
  gem 'turn', :require => false
end
