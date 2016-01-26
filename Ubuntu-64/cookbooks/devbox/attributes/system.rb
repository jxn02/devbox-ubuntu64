require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['system']['timezone'] = params['system']['timezone']

default['glances']['extra_pip_packages'] = ['bottle']
default['glances']['service'] = {
  RUN: true,
  DAEMON: '/usr/local/bin/glances',
  DAEMON_ARGS: '-w'
}