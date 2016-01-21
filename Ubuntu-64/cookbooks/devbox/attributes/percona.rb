require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

## Pas de vérification gpg du package
default["percona"]["yum"]["gpgcheck"] = false

## Nom d'utilisateur => ROOT et Suppression du password
default["percona"]["skip_passwords"] = "true"
default["percona"]["server"]["debian_username"] = "root"

## Saisir le nom de la/les bases de données dans le tableau suivant
default["database"]["dbname"] = params['mysql']['dbname']

## Saisir un nom d'utilisateur pour la base de données correspondante
default["database"]["username"] = params['mysql']['username']


## Optimisation BDD
default["percona"]["server"]["innodb_buffer_pool_size"] = "512M"
default["percona"]["server"]["innodb_thread_concurrency"] = 8