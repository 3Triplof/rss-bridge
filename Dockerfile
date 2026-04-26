FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    git unzip libzip-dev \
    && docker-php-ext-install zip curl

RUN a2enmod rewrite

WORKDIR /var/www/html

# 🔥 clona versão estável
RUN git clone --branch 2023-07-10 https://github.com/RSS-Bridge/rss-bridge.git .

# cache
RUN mkdir cache && chmod -R 777 cache

EXPOSE 80
