require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['system']['timezone'] = params['system']['timezone']