# Table des Matières

1. [Qu’est-ce qu’un conteneur ?](#qu’est-ce-qu’un-conteneur)
2. [Est-ce que Docker a inventé les conteneurs Linux ? Qu’a apporté Docker à cette technologie ?](#est-ce-que-docker-a-inventé-les-conteneurs-linux-qu’a-apporté-docker-à-cette-technologie)
3. [Pourquoi est-ce que Docker est particulièrement pensé et adapté pour la conteneurisation de processus sans états (fichiers, base de données, etc.) ?](#pourquoi-est-ce-que-docker-est-particulièrement-pensé-et-adapté-pour-la-conteneurisation-de-processus-sans-états-fichiers-base-de-données-etc)
4. [Quel artefact distribue-t-on et déploie-t-on dans le workflow de Docker ? Quelles propriétés désirables doit-il avoir ?](#quel-artefact-distribue-t-on-et-déploie-t-on-dans-le-workflow-de-docker-quelles-propriétés-désirables-doit-il-avoir)
5. [Quelle est la différence entre les commandes `docker run` et `docker exec` ?](#quelle-est-la-différence-entre-les-commandes-docker-run-et-docker-exec)
6. [Peut-on lancer des processus supplémentaires dans un même conteneur docker en cours d’exécution ?](#peut-on-lancer-des-processus-supplémentaires-dans-un-même-conteneur-docker-en-cours-d’exécution)
7. [Pourquoi est-il fortement recommandé d’utiliser un tag précis d’une image et de ne pas utiliser le tag `latest` dans un projet Docker ?](#pourquoi-est-il-fortement-recommandé-d’utiliser-un-tag-précis-d’une-image-et-de-ne-pas-utiliser-le-tag-latest-dans-un-projet-docker)
8. [Décrire le résultat de cette commande : `docker run -d -p 9001:80 --name my-php -v "$PWD":/var/www/html php:7.2-apache`](#décrire-le-résultat-de-cette-commande-docker-run--d--p-900180---name-my-php--v-pwdvarwwwhtml-php72-apache)
9. [Avec quelle commande docker peut-on arrêter tous les conteneurs ?](#avec-quelle-commande-docker-peut-on-arrêter-tous-les-conteneurs)
10. [Quelles précautions doit-on prendre pour construire une image afin de la garder de petite taille et faciliter sa reconstruction ? (2 points)](#quelles-précautions-doit-on-prendre-pour-construire-une-image-afin-de-la-garder-de-petite-taille-et-faciliter-sa-reconstruction-2-points)
11. [Lorsqu’un conteneur s’arrête, tout ce qu’il a pu écrire sur le disque ou en mémoire est perdu. Vrai ou faux ? Pourquoi ?](#lorsqu’un-conteneur-s’arrête-tout-ce-qu’il-a-pu-écrire-sur-le-disque-ou-en-mémoire-est-perdu-vrai-ou-faux-pourquoi)
12. [Lorsqu’une image est créée, elle ne peut plus être modifiée. Vrai ou faux ?](#lorsqu’une-image-est-créée-elle-ne-peut-plus-être-modifiée-vrai-ou-faux)
13. [Comment peut-on publier et obtenir facilement des images ?](#comment-peut-on-publier-et-obtenir-facilement-des-images)
14. [Comment s’appelle l’image de plus petite taille possible ? Que contient-elle ?](#comment-s’appelle-l’image-de-plus-petite-taille-possible-que-contient-elle)
15. [Par quel moyen le client Docker communique-t-il avec le serveur *dockerd* ?](#par-quel-moyen-le-client-docker-communique-t-il-avec-le-serveur-dockerd)
16. [Un conteneur doit lancer un processus par défaut que l’on pourra override à l’exécution.](#un-conteneur-doit-lancer-un-processus-par-défaut-que-l’on-pourra-override-à-l’exécution)

---

# Qu’est-ce qu’un conteneur ?

Un package logiciel unique, appelé « conteneur », regroupe le code d’une application avec les fichiers de configuration, les bibliothèques et les dépendances requises pour que l’application puisse s’exécuter. Ceci permet aux développeurs et aux professionnels de l’informatique de déployer les applications de façon transparente dans tous les environnements.

# Est-ce que Docker a inventé les conteneurs Linux ? Qu’a apporté Docker à cette technologie ?

Non, les conteneurs existaient déjà.

Docker a révolutionné la conteneurisation en la rendant :
- **Facile à utiliser**: Interface conviviale et commandes intuitives.
- **Portable**: Fonctionne sur différents systèmes d'exploitation (Windows, Linux, macOS).
- **Isolée**: Exécute les applications indépendamment les unes des autres.
- **Léger**: N'inclut que les bibliothèques nécessaires.
- **Orchestrée**: Gère les applications conteneurisées à grande échelle.
- **Soutenue par une communauté active et un large écosystème**.

# Pourquoi est-ce que Docker est particulièrement pensé et adapté pour la conteneurisation de processus sans états (fichiers, base de données, etc.) ?

## Docker et processus sans état : une adéquation parfaite

- **Léger**: Idéal pour les processus sans données lourdes.
- **Immuable**: Exécution cohérente et prévisible.
- **Reproductible**: Déploiement identique sur tous les environnements.
- **Isolé**: Protection contre les interférences et les pannes.
- **Orchestré**: Gestion automatisée à grande échelle.

# Quel artefact distribue-t-on et déploie-t-on dans le workflow de Docker ? Quelles propriétés désirables doit-il avoir ?

Dans le workflow de Docker, l'artefact principal distribué et déployé est le conteneur Docker lui-même. Un conteneur Docker encapsule une application et toutes ses dépendances logicielles dans un package standardisé, ce qui permet de le distribuer facilement et de le déployer de manière cohérente sur différentes infrastructures.

## Propriétés désirables :
- **Portabilité**: Le conteneur doit être portable, ce qui signifie qu'il doit pouvoir s'exécuter de manière cohérente et prévisible sur différentes infrastructures, qu'il s'agisse de serveurs locaux, de machines virtuelles ou de services de cloud computing.
- **Isolation**: Le conteneur doit fournir un niveau d'isolation pour l'application qu'il contient, afin d'éviter les conflits avec d'autres applications s'exécutant sur le même hôte. Cela garantit également que les dépendances de l'application sont correctement encapsulées.
- **Légèreté**: Les conteneurs Docker doivent être légers, ce qui signifie qu'ils doivent avoir une empreinte mémoire et disque minimale. Cela permet de déployer et de mettre à l'échelle rapidement des applications conteneurisées.
- **Reproductibilité**: Les conteneurs doivent être reproductibles, ce qui signifie que le même conteneur doit produire le même comportement lorsqu'il est exécuté sur différentes machines ou à différents moments. Cela garantit une cohérence dans les environnements de développement, de test et de production.
- **Facilité de gestion**: Les conteneurs Docker doivent être faciles à gérer et à orchestrer, ce qui signifie qu'ils doivent pouvoir être démarrés, arrêtés, mis à jour et surveillés facilement à l'aide d'outils comme Docker Compose, Kubernetes ou d'autres solutions d'orchestration de conteneurs.
- **Sécurité**: Les conteneurs doivent être sécurisés, en limitant les accès aux ressources du système hôte et en appliquant les bonnes pratiques de sécurité pour l'application qu'ils contiennent.

# Quelle est la différence entre les commandes `docker run` et `docker exec` ?

- La commande `docker run` est utilisée pour créer une nouvelle instance d'un conteneur à partir d'une image Docker.
- La commande `docker exec` est utilisée pour exécuter une commande à l'intérieur d'un conteneur Docker qui est déjà en cours d'exécution.

# Peut-on lancer des processus supplémentaires dans un même conteneur docker en cours d’exécution ?

Oui, on peut lancer des processus supplémentaires à l'intérieur d'un conteneur Docker qui est déjà en cours d'exécution en utilisant la commande `docker exec`. Cette commande nous permet d'exécuter une commande à l'intérieur du conteneur spécifié.

# Pourquoi est-il fortement recommandé d’utiliser un tag précis d’une image et de ne pas utiliser le tag `latest` dans un projet Docker ?

Il est fortement recommandé d'utiliser un tag précis d'une image Docker plutôt que le tag "latest" pour plusieurs raisons :

- **Stabilité des versions** : L'utilisation d'un tag précis garantit que notre application utilise une version spécifique et connue de l'image Docker. Cela évite les surprises causées par les mises à jour automatiques de l'image "latest", qui pourraient introduire des changements inattendus ou des régressions dans votre environnement de production.
- **Reproductibilité** : En spécifiant explicitement une version d'image, nous nous assurons de la reproductibilité de notre environnement de développement, de test et de production. Cela signifie que d'autres membres de notre équipe ou de déploiement ultérieur utiliseront exactement la même version de l'image Docker, ce qui facilite le débogage et la collaboration.
- **Contrôle de la mise à jour** : En évitant d'utiliser le tag "latest", nous avons un contrôle plus granulaire sur les mises à jour de l'image Docker. Nous pouvons décider quand et comment mettre à jour votre application en choisissant délibérément d'adopter de nouvelles versions d'image après avoir testé leur compatibilité avec votre application.
- **Prévention des erreurs de déploiement** : L'utilisation du tag "latest" peut parfois conduire à des erreurs de déploiement si l'image "latest" a été mise à jour avec des changements non compatibles avec notre application. En utilisant des tags précis, nous évitons ce risque en nous assurant que seules les versions d'image spécifiques et validées sont déployées.

# Décrire le résultat de cette commande : `docker run -d -p 9001:80 --name my-php -v "$PWD":/var/www/html php:7.2-apache`

Cette commande Docker exécute un conteneur basé sur l'image Docker `php:7.2-apache`. 

Voici ce que chaque partie de la commande fait :
- `docker run`: Cette commande est utilisée pour exécuter un conteneur à partir d'une image Docker.
- `-d`: Cela indique à Docker de détacher le conteneur de notre terminal, ce qui signifie qu'il s'exécutera en arrière-plan.
- `-p 9001:80`: Cela mappe le port 9001 de l'hôte (notre machine locale) au port 80 du conteneur. Ainsi, nous pourrons accéder à l'application hébergée dans le conteneur via le port 9001 de notre machine.
- `--name my-php`: Cela attribue le nom "my-php" au conteneur.
- `-v "$PWD":/var/www/html`: Cela monte le répertoire de travail actuel de notre machine locale (représenté par `$PWD`) dans le répertoire `/var/www/html` du conteneur. Cela permet de partager des fichiers entre notre machine locale et le conteneur, utile notamment pour le développement.
- `php:7.2-apache`: C'est l'image Docker à partir de laquelle le conteneur sera lancé. Dans ce cas, il s'agit de l'image PHP avec Apache, version 7.2.

# Avec quelle commande docker peut-on arrêter tous les conteneurs ?

Avec la commande `docker stop`.

# Quelles précautions doit-on prendre pour construire une image afin de la garder de petite taille et faciliter sa reconstruction ? (2 points)

Pour construire une image Docker de petite taille et faciliter sa reconstruction, il faut :
- Utiliser des images de base légères comme Alpine Linux
- Minimiser le nombre de couches en regroupant les commandes RUN
- Nettoyer les dépendances inutiles
- Utiliser `.dockerignore` pour exclure les fichiers inutiles
- Opter pour des images multi-étapes pour réduire la taille finale
- Éviter les commandes superflues pour limiter les fichiers et les opérations inclus dans l'image.

# Lorsqu’un conteneur s’arrête, tout ce qu’il a pu écrire sur le disque ou en mémoire est perdu. Vrai ou faux ? Pourquoi ?

Par défaut, les données écrites sur le disque et en mémoire à l'intérieur d'un conteneur Docker sont perdues lorsque le conteneur s'arrête, mais nous pouvons utiliser des volumes Docker pour faire persister les données sur le disque au-delà du cycle de vie du conteneur.

# Lorsqu’une image est créée, elle ne peut plus être modifiée. Vrai ou faux ?

Faux. Une image Docker n'est pas immuable en soi.

# Comment peut-on publier et obtenir facilement des images ?

Pour publier et obtenir des images Docker facilement, nous pouvons utiliser des registres publics comme *Docker Hub* ou *Quay.io*. Pour des besoins de sécurité et de contrôle, il faut opter pour des registres privés tels que *Docker Enterprise* ou *GitLab Container Registry*. Nous pouvons également automatiser le processus avec des outils comme *Jenkins* ou *GitLab CI/CD*, ou partager des images via des plateformes de stockage de fichiers comme *Dropbox* ou *Google Drive* pour des échanges ponctuels. Il faut choisir la méthode en fonction de nos besoins en visibilité, sécurité et automatisation.

# Comment s’appelle l’image de plus petite taille possible ? Que contient-elle ?

Alpine Linux. 

L’image contient actuellement les paquets utilisés couramment tels que GNOME, XFCE, Firefox, et d'autres.

# Par quel moyen le client Docker communique-t-il avec le serveur *dockerd* ?

Il communique à travers l’API Docker. 

## Est-il possible de communiquer avec le serveur via le protocole HTTP ? Pourquoi ?

Oui, cela est possible grâce à l'API *HTTP RESTful* exposée par le serveur Docker.

# Un conteneur doit lancer un processus par défaut que l’on pourra override à l’exécution. 

## Quelle commande faut-il utiliser pour lancer ce processus : CMD ou ENTRYPOINT ?

C’est la commande CMD qu’il faut utiliser pour cela.
