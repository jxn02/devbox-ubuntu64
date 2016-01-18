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

    when "source"

end

include_recipe 'xdebug'
include_recipe 'phpmd'
include_recipe 'phpcs::default'
include_recipe 'phpcs::coding_standard'

php_fpm_pool "#{node[:devbox][:app_name]}" do
    pool_name           node[:devbox][:app_name]
    listen              '/var/run/php5-fpm.sock'
    user                node[:devbox][:user]
    group               node[:devbox][:group]
    action              :install
end

service "php5-fpm" do
  action :restart
end