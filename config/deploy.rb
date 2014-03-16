require 'bundler/capistrano'
require 'rvm/capistrano'

default_run_options[:pty] = true  # Must be set for the password prompt
# from git to work

set :rvm_ruby_string, 'ruby-2.1.1'
set :rvm_type, :user
set :application, "chezhongguo"
set :repository, "git://github.com/sitoto/chezhongguo.git"
set :branch, "master"
set :scm, :git
set :user, "sitoto"
set :deploy_to, "/mnt/www/#{application}"
#set :runner, "sitoto"

set :git_shallow_clone, 1 # Shallow cloning will do a clone each time, 
# but will only get the top commit, 
# not the entire repository history.

role :web, "42.121.0.135"                         # Your HTTP server, Apache/etc
role :app, "42.121.0.135"                          # This may be the same as your `Web` server
role :db,  "42.121.0.135" , :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
#load 'deploy/assets'

set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_path} -D"
  end

  task :stop, :roles => :app do
    run "kill -QUIT `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "kill -USR2 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end
end

namespace :delayed_job do
  desc "Start delayed_job process" 
  task :start, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production bin/delayed_job start "
  end

  desc "Stop delayed_job process" 
  task :stop, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production bin/delayed_job stop"
  end

  desc "Restart delayed_job process" 
  task :restart, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production bin/delayed_job restart"
  end
end

task :init_shared_path, :roles => :web do
  run "mkdir -p #{deploy_to}/shared/log"
  run "mkdir -p #{deploy_to}/shared/pids"
  run "mkdir -p #{deploy_to}/shared/assets"
end

task :link_shared_files, :roles => :web do
  run "ln -sf #{deploy_to}/shared/config/*.yml #{deploy_to}/current/config/"
  run "ln -sf #{deploy_to}/shared/config/unicorn.rb #{deploy_to}/current/config/"
  run "ln -sf #{deploy_to}/shared/config/initializers/secret_token.rb #{deploy_to}/current/config/initializers"
end

task :compile_assets, :roles => :web do
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake assets:precompile"
end

task :mongoid_create_indexes, :roles => :web do
    run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:mongoid:create_indexes"
end

after "deploy:finalize_update","deploy:symlink", :init_shared_path, :link_shared_files, :compile_assets

#after "deploy:start", "delayed_job:start"
#after "deploy:stop", "delayed_job:stop"
#after "deploy:restart", "delayed_job:restart"

