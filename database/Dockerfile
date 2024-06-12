# Utiliser l'image officielle MySQL
FROM mysql:8.4.0

# Définir les arguments de construction
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

# Définir les variables d'environnement
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

# Copier le script SQL d'initialisation
COPY init.sql /docker-entrypoint-initdb.d/

# Create the db_client user and grant privileges
RUN mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'db_client'@'%' IDENTIFIED BY 'password';"
RUN mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'db_client'@'%';"


# Exposer le port MySQL
EXPOSE 3306
