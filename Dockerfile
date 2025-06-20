FROM php:8.2-apache

# Enable Apache rewrite and set permissions
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy all your files into the container
COPY . /var/www/html/

# Move HTML files out of the 'template' folder into root
RUN mv /var/www/html/template/*.html /var/www/html/ && rm -r /var/www/html/template

# Set permissions
RUN chmod -R 755 /var/www/html/

EXPOSE 80
