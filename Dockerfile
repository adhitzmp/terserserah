FROM php:8.2-fpm
WORKDIR /var/www/html
COPY . /var/www/html
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN php artisan key:generate
CMD php artisan serve --host=0.0.0.0 --port=8080
EXPOSE 8080