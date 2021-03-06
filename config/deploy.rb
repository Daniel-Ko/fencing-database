# config valid only for current version of Capistrano
lock '3.6.1'

set :application, ''
set :repo_url, 'git@github.com:sdubinsky/fencing-database.git'

set :deploy_to, '/home/ec2-user/fencing-database'

set :linked_files, fetch(:linked_files, []).push('config.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log')
set :bundle_bins, fetch(:bundle_bins, []).push('ruby', 'god')

before "deploy:restart_server", "db:migrate"
