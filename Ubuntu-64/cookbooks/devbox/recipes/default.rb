## Appels des récipes par ordre de dépendances
include_recipe 'devbox::system'
include_recipe 'devbox::users'
include_recipe 'devbox::mongodb'
include_recipe 'devbox::redis'
include_recipe 'devbox::mailhog'
include_recipe 'devbox::php'
include_recipe 'devbox::apache2'
include_recipe 'devbox::percona'
#include_recipe 'devbox::nginx'


## Dépot du fichier phpinfo à la racine de l'environnement
template "#{node['devbox']['app_root']}/phpinfo.php" do
    source      'phpinfo.php.erb'
    owner       node['devbox']['user']
    group       node['devbox']['group']
    mode        '644'
end