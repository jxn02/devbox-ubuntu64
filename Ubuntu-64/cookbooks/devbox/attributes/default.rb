require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

## Attributs globaux
default[:devbox][:app_name] = params['project']['name']
default[:devbox][:server_name] = params['project']['domain']
default[:devbox][:app_root] = "/var/www/#{node[:devbox][:app_name]}"

## Appels des attributs
include_attribute 'devbox::system'
include_attribute 'devbox::users'
include_attribute 'devbox::mongodb'
include_attribute 'devbox::redis'
include_attribute 'devbox::mailhog'
include_attribute 'devbox::php'
include_attribute 'devbox::apache2'
include_attribute 'devbox::percona'