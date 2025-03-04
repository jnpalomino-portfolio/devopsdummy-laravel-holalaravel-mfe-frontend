FROM php:8.2-fpm-alpine

# Instalar dependencias esenciales
RUN apk add --no-cache \
    git \
    zip \
    unzip \
    libpng-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql bcmath gd zip \
    && rm -rf /var/cache/apk/*

# Instalar Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Crear directorio de trabajo
WORKDIR /app/frontend

# Copiar solo los archivos necesarios primero
COPY composer.json composer.lock ./

# Copiar el resto de la aplicación
COPY . .

# Instalar dependencias de producción
RUN composer install --no-dev --optimize-autoloader

# Configurar permisos
# RUN chown -R www-data:www-data storage bootstrap/cache \
#    && chmod -R 775 storage bootstrap/cache
RUN chgrp -R 0 /app
RUN chmod -R g=u /app

EXPOSE 8009

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8009"]
