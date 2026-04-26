FROM php:8.1-apache

# dependências
RUN apt-get update && apt-get install -y \
    unzip libzip-dev \
    && docker-php-ext-install zip curl \
    && rm -rf /var/lib/apt/lists/*

# apache
RUN a2enmod rewrite

WORKDIR /var/www/html

# 🔥 copia arquivos (melhor que git clone)
COPY . .

# cache
RUN mkdir -p cache && chmod -R 777 cache

# 🔥 usa porta dinâmica do Railway
ENV PORT=80

EXPOSE 80
