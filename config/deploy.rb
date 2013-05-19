require "rvm/capistrano"
require "bundler/capistrano"

set :deploy_to, "/home/rails/myapp"
set :repository,  "git://github.com/cabincontainer/First-Step.git"
set :rvm_ruby_string, "1.9.3-p194@cabincontainer"
set :use_sudo, false
set :deploy_via, :remote_cache

set :user, "rails"
role :web, "198.199.105.109"
role :app, "198.199.105.109"
role :db,  "localhost", :primary => true

after "deploy:restart", "deploy:cleanup"
after "deploy", "rvm:trust_rvmrc"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end