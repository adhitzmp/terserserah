FROM composer as composer_build
FROM php:8.2-fpm
WORKDIR /var/www/html
COPY . /var/www/html
RUN composer install
RUN php artisan key:generate
CMD php artisan serve --host=0.0.0.0 --port=8080
EXPOSE 8080