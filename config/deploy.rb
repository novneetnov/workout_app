set :user, "novneet"
set :application, "workout_app_deploy"
set :domain, "workout.localhost.com"

set :repository, "https://github.com/novneetnov/workout_app"
set :deploy_to, "/home/#{user}/web_development/deployment/#{application}"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :branch, 'master'
set :scm_verbose, true

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

set :deploy_via, :remote_cache
set :use_sudo, false
set :normalize_asset_timestamps, false
set :rails_env, :production

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	desc "Restart Passenger after deploy"
	task :restart, :roles => :app, :except => { :no_release => true } do
	 run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end
	desc "reload the database with seed data"
	task :seed do
		deploy.migrations
		run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
	end
end
