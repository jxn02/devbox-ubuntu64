include_recipe 'php::default'

case node['php']['install_method']
    when "package"

        package "php5-mcrypt" do
            action      :install
            notifies    :run, "execute[/usr/sbin/php5enmod mcrypt]", :immediately
        end
        execute '/usr/sbin/php5enmod mcrypt' do
            action :nothing
        end
        package "php5-curl" do
            action :install
        end
        package "php5-gd" do
            action :install
        end
        package "php5-mysql" do
            action :install
        end
        package "php5-xsl" do
            action :install
        end
        package "php5-intl" do
            action :install
        end
        package "php5-redis" do
            action :install
        end
        package "php5-imagick" do
            action :install
        end

    when "source"

end

include_recipe 'xdebug'
include_recipe 'phpmd'
include_recipe 'phpcs::default'
include_recipe 'phpcs::coding_standard'

fpm_additional_config = {
    'php_admin_flag[log_errors]' => 'on',
    'php_admin_value[memory_limit]' => '768M',
    'php_admin_value[max_execution_time]' => '1800'
}

php_fpm_pool "#{node[:devbox][:app_name]}" do
    pool_name           node[:devbox][:app_name]
    listen              '/var/run/php5-fpm.sock'
    user                node[:devbox][:user]
    group               node[:devbox][:group]
    process_manager     'static'
    start_servers       2
    min_spare_servers   1
    max_spare_servers   8
    additional_config   fpm_additional_config
    action              :install
end

template "#{node['php']['conf_dir_fpm']}/php.ini" do
  source node['php']['ini']['template']
  cookbook node['php']['ini']['cookbook']
  unless platform?('windows')
    owner 'root'
    group node['root_group']
    mode '0644'
  end
  variables(directives: node['php']['directives'])
end

service "php5-fpm" do
  action :restart
end