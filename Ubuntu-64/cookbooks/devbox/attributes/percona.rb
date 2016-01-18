require 'yaml'
params = YAML::load_file("/vagrant/config.yml")

############  Nom d'utilisateur => ROOT et Suppression du password      ########
default["percona"]["skip_passwords"] = "true"
default["percona"]["server"]["debian_username"] = "root"

######## Saisir le nom de la/les bases de données dans le tableau suivant #####################
default["database"]["dbname"] = params['mysql']['dbname']

######## Saisir un nom d'utilisateur et un mdp pour la base de données correspondante #####################
default["database"]["username"] = params['mysql']['username']
default["database"]["password"] = params['mysql']['password']
