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

set :format, :pretty
set :log_level, :debug
