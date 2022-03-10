FROM php:8-fpm

ENV XDEBUG_MODE=coverage

RUN apt-get update && apt-get install -y curl zip unzip && apt-get clean -y

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer