require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

default['mailhog']['version'] = '0.1.8'
default['mailhog']['binary']['checksum']['linux_amd64'] = '678d736cc85e1fc9fa9451112b8b049db6f2ae22f2bcccf4de9a007aa91ff735'

default['devbox']['mailhog']['storage'] = 'mongodb'