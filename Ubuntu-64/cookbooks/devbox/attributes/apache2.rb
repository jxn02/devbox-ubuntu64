require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['apache']['user'] = default[:devbox][:user]
default['apache']['group'] = default[:devbox][:group]
default['devbox']['apache2']['template'] = params['apache2']['template']
