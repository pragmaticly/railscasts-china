require 'bundler/capistrano'

set :application, "railscasts-china"
set :repository,  "git://github.com/pragmaticly/railscasts-china.git"

ssh_options[:user] = 'deploy'
ssh_options[:forward_agent] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/railscasts-china"

set :use_sudo, false
set :keep_releases, 5

set :rails_env, "production"
set :branch, "master"

role :web, "106.187.38.165"                          # Your HTTP server, Apache/etc
role :app, "106.187.38.165"                          # This may be the same as your `Web` server
role :db,  "106.187.38.165", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  desc "symlink shared files"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/"
    run "mkdir -p #{release_path}/tmp/cache/assets"
    run "cd #{release_path}; RAILS_ENV=#{rails_env} rake assets:precompile"
  end

  task :start do
  end

  task :stop do
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

require './config/boot'

