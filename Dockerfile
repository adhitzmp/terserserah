FROM php:8.2-fpm
WORKDIR /var/www/html
COPY . /var/www/html
EXPOSE 8080
CMD php artisan serve --host=0.0.0.0 --port=8080