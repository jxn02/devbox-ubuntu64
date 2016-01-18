require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default[:devbox][:user] = params['user']['name']
default[:devbox][:password] = params['user']['password'] # Mot de passe: groupeafg59
default[:devbox][:group] = params['user']['group']