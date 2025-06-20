FROM php:8.2-apache

# Enable mod_rewrite (needed for .htaccess to work)
RUN a2enmod rewrite

# Copy all files into the web root
COPY . /var/www/html/

# Allow .htaccess to override settings
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

EXPOSE 80
