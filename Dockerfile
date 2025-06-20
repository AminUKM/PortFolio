FROM php:8.2-apache

# Enable .htaccess and mod_rewrite
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy project files
COPY . /var/www/html/

# Move HTML files out of /template to root and remove /template
RUN mv /var/www/html/template/*.html /var/www/html/ && rm -r /var/www/html/template

# Set permissions
RUN chmod -R 755 /var/www/html/

# Set the default landing page
RUN echo "DirectoryIndex index.html" > /var/www/html/.htaccess

EXPOSE 80
