FROM php:8.2-apache

# Enable .htaccess support
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy all files into the container
COPY . /var/www/html/

# Move your HTML files from /template to root
RUN mv /var/www/html/template/*.html /var/www/html/ && rm -r /var/www/html/template

# Set correct permissions
RUN chmod -R 755 /var/www/html/

EXPOSE 80
