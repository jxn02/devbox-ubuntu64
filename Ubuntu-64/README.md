# README #

Package contenant la configuration de la machine virtuelle de développement E-commerce Team

### Pré-requis ###

VirtualBox et Vagrant

ChefDK : https://downloads.chef.io/chef-dk/windows/

Redémarrer le PC après installation de ChefDK

Une fois Vagrant installé, lancer les commandes suivantes :

* vagrant plugin install vagrant-hostmanager

* vagrant plugin install vagrant-berkshelf

* vagrant plugin install vagrant-omnibus

# SERVICES #

* MailHog : Intercepte les mails envoyés par les applis de dev. Pour les afficher utiliser le navigateur, puis accédez à l'url mailhog.{nom_de_domaine_vm})

* MongoDB : Moteur de bases de données NoSQL utilisé par MailHog pour stocker les mails interceptés.

* Redis : Système de cache clé/valeur avec stockage par fichier

* Cron : Permet d'ajouter des tâches cron sur la VM


### FAQ ###

Voir avec Julien pour toute question :)