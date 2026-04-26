FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git unzip libzip-dev \
    && docker-php-ext-install zip curl

RUN a2enmod rewrite

WORKDIR /var/www/html

RUN git clone https://github.com/RSS-Bridge/rss-bridge.git .

RUN mkdir cache && chmod -R 777 cache

EXPOSE 80
