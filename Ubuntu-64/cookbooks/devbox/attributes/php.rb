require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

## PHP
default['php']['install_method'] = params['php']['install_method']
default['php']['url'] = 'http://fr2.php.net/get'
default['php']['version'] = '5.6.16'
default['php']['checksum'] = 'b6618df6b11a275fa28596f1775727679f8492e100f3bd488d8a8bfbfc19349f'

## Php Code Sniffer
default['phpcs']['coding_standards'] = {"Magento" => { "repository" => "git://github.com/magento-ecg/coding-standard.git", "reference" => "master" }}

## Xdebug
ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first
remote_ip = ip.gsub /\.\d+$/, '.1'
default['xdebug']['config_file'] = '/etc/php5/mods-available/xdebug.ini'
default['xdebug']['web_server']['service_name'] = ''
default['xdebug']['directives'] = {"remote_enable" => 1, "remote_host" => remote_ip}