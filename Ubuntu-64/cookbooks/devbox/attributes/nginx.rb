require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['nginx']['enable_default_site'] = false

default['nginx']['install_method'] = 'source'
default['nginx']['source']['version'] = '1.9.9'
default['nginx']['source']['prefix']  = "/opt/nginx-#{node['nginx']['source']['version']}"
default['nginx']['source']['url']  = "http://nginx.org/download/nginx-#{node['nginx']['source']['version']}.tar.gz"
default['nginx']['source']['checksum'] = 'de66bb2b11c82533aa5cb5ccc27cbce736ab87c9f2c761e5237cda0b00068d73'