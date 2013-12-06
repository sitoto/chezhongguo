#encoding: UTF-8
set :application, "chezhongguo"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :repository,  "git@42.121.83.163:chezhongguo"
set :branch, "master"
set :user, "ruby"
set :keep_releases, 5


set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, "production"

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

set :bundler_cmd, "bundle install --deployment --without=development,test"


namespace :deploy do

  task :start do ; end
  task :stop do ; end

#  task :chmod, :roles => :web do
#    run "chmod -R 777 #{deploy_to}/*"
#  end

#  task :update_symlink do
#    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
#  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end


set :default_environment, {
  'PATH' => "/home/ruby/.rvm/gems/ruby-1.9.3-p194/bin:/home/ruby/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/ruby/.rvm/rubies/ruby-1.9.3-p194/bin:/home/;",
  'RUBY_VERSION' => 'ruby-1.9.3-p194',
  'GEM_HOME' => '/home/sitoto/.rvm/gems/ruby-1.9.3-p194',
  'GEM_PATH' => '/home/sitoto/.rvm/gems/ruby-1.9.3-p194:/home/sitoto/.rvm/gems/ruby-1.9.3-p194@global'
}

#after "deploy:finalize_update", "deploy:update_symlink" # 如果有實作使用者上傳檔案到public/system，請打開






