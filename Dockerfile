FROM php:8.2-apache

# Enable .htaccess (if you use it)
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy everything into Apache directory
COPY . /var/www/html/

# Move template HTML files to root directory
RUN mv /var/www/html/template/*.html /var/www/html/ && rm -r /var/www/html/template

# Ensure permissions
RUN chmod -R 755 /var/www/html/

EXPOSE 80
