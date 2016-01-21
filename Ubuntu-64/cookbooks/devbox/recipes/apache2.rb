include_recipe 'apache2::default'
include_recipe 'apache2::mpm_event'
include_recipe 'apache2::mod_actions'
include_recipe 'apache2::mod_authz_core'
include_recipe 'apache2::mod_setenvif'
include_recipe 'apache2::mod_fastcgi'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_status'
include_recipe 'apache2::mod_headers'
include_recipe 'apache2::mod_expires'
include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'

directory '/var/www/cgi-bin' do
    owner       'www-data'
    group       'www-data'
    mode        '0775'
    recursive   true
end

template '/etc/apache2/mods-available/fastcgi.conf' do
    source 'apache2/mods/fastcgi.conf.erb'
    owner 'root'
    group 'root'
    mode '0755'
    notifies :reload, 'service[apache2]', :delayed
    action  :create
end

web_app node[:devbox][:app_name] do
    server_name node[:devbox][:server_name]
    cookbook    'devbox'
    template    "apache2/sites-available/" + node[:devbox][:apache2][:template] + ".conf.erb"
    enable      :true
end

web_app "mailhog-"+node[:devbox][:app_name] do
    server_name "mailhog." + node[:devbox][:server_name]
    cookbook    'devbox'
    template    "apache2/sites-available/" + node[:devbox][:apache2][:template_mailhog] + ".conf.erb"
    enable      :true
end