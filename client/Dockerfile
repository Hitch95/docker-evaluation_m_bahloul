# Use the official PHP image with Apache
FROM php:7.4-apache

# Enable MySQLi extension
RUN docker-php-ext-install mysqli

# Copy the PHP application code to the container
COPY src/ /var/www/html/
