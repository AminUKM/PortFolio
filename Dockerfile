FROM php:8.2-apache

# Enable .htaccess (if you're using it)
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy everything
COPY . /var/www/html/

# Move HTML files from /template to root
RUN mv /var/www/html/template/*.html /var/www/html/ && rm -rf /var/www/html/template

EXPOSE 80
