include_recipe 'nginx::package'

nginx_site 'default' do
    enable false
end

nginx_site "#{node[:devbox][:app_name]}" do
    template "nginx/sites-available/#{node[:devbox][:app_name]}.erb"
    action :enable
end