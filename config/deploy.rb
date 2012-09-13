# require "bundler/capistrano"
# require 'capistrano/ext/multistage'


# set :stages, %w(geoffs2 workflows01)
# set :default_stage, "geoffs2"
# Workflows 	01 - closewatch job
# 				02 - headless
# 				03 - standard nokogiri

# set :stages, %w(workflows01 workflows02 workflows03)
# set :default_stage, "workflows01"


set :application, "apprentice"
set :scm, :git
set :deploy_via, :copy
set :repository,  "ssh://gitolite@78.129.181.26:2212/bb_rails_apprenticeship_guide"
set :branch, "master"

set :user, 'apprentice'
set :port, "2212"
set :deploy_to, "/var/www/#{application}"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true


server "37.128.189.139", :app, :web, :db, :primary => true

load 'deploy/assets'

namespace :deploy do  

	task :restart do
	    run "rm /var/www/apprentice/current/config/database.yml"
	    run "ln -s /var/www/apprentice/shared/database.yml /var/www/apprentice/current/config/database.yml"
	    run "rm -rf /var/www/apprentice/current/log"
	    run "ln -s /var/www/apprentice/shared/log /var/www/apprentice/current/log"
	    run "touch /var/www/apprentice/current/tmp/restart.txt"
	end

end