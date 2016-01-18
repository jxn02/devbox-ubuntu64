## Création du group utilisateur
group node['devbox']['group'] do
    action      :create
end

## Création de l'utilisateur
user node['devbox']['user'] do
    home        node['devbox']['app_root']
    password    node['devbox']['password']
    group       node['devbox']['group']
    shell       '/bin/bash'
    action      :create
end

## Création du répertoire home de l'utilisateur
directory node['devbox']['app_root'] do
    owner       node['devbox']['user']
    group       node['devbox']['group']
    mode        '0755'
    recursive   true
end

## Ajout de l'utilisateur au group www-data
group 'www-data' do
    members       node['devbox']['user']
    append        true
    action        :modify
end
