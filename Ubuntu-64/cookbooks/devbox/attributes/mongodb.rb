require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['mongodb3']['version'] = '3.2.1'
default['mongodb3']['package']['version'] = '3.2.1'

default['mongodb3']['package']['repo']['url'] = 'http://repo.mongodb.org/apt/ubuntu/'
default['mongodb3']['package']['repo']['apt']['keyserver'] = 'hkp://keyserver.ubuntu.com:80'
default['mongodb3']['package']['repo']['apt']['key'] = 'EA312927'
default['mongodb3']['package']['repo']['apt']['components'] = ['multiverse']