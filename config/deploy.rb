# Lock to Capistrano version
lock '3.3.5'

set :application, 'tripmustsees'

# Deployment configuration
set :deploy_user, 'deploy'
set :deploy_to, "/home/#{fetch(:deploy_user)}"
set :keep_releases, 5

# Version control configuration
set :scm, :git
set :repo_url, "git@github.com:dobrinov/#{fetch(:application)}.git"

# Rbenv configuration
set :rbenv_type, :system
set :rbenv_ruby, "2.1.3"
set :rbenv_custom_path, "/home/#{fetch(:deploy_user)}/.rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

# Linked dirs
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

set :format, :pretty
set :log_level, :debug

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end

  after "deploy:setup", "deploy:setup_config"
end
