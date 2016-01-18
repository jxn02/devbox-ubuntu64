require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['redisio']['version'] = '3.0.6'
default['redisio']['servers'] = [{'port' => '6379'}]