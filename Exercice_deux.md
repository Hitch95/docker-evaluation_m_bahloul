# Exercice 2 : Projet web avec compose (12 points)

## 2. Quelle commande faut-il utiliser pour ouvrir un processus bash interactif sur le conteneur de la base de données MySQL ? Donner ensuite les commandes shell à utiliser pour vérifier que la base par défaut est bien présente ainsi que son contenu initial. 

## 3. Réaliser un dump de la base de données sur votre machine hôte avec mysqldump en exécutant une commande supplémentaire sur le conteneur MySQL avec `docker compose exec` sans utiliser le mode interactif (sans ouvrir de session bash au préalable). Stocker le dump dans un fichier `dump.sql`. Donner la commande pour réaliser cette tâche. 
Remarque : le conteneur MySQL dispose déjà du programme mysqldump, inutile de l’installer.

## 4. Associer un volume (ou bind-mount) au service database pour persister les données sur le disque dans un dossier `data` local au projet. Pour cela, modifier le fichier Compose.

## 5. Au lancement du projet, le service client doit interroger la base de données `docker_doc_dev` et afficher le contenu de la table `article` de la base de données `docker_doc_dev` sur une page web (document HTML). Pour cela, créer votre propre image à partir de l’image officielle `php:8.2-apache` et installer le module PDO_MYSQL avec l’instruction suivante :

apt-get update && apt-get install -y \
libmariadb-dev \
&& docker-php-ext-install pdo_mysql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

## 6. Configurer le fichier Compose pour permettre de développer le script client PHP (le modifier, l’éditer) sans avoir à reconstruire l’image à chaque changement.
Indiquer la commande pour lancer le projet permettant de recharger les sources dès qu’elles changent.