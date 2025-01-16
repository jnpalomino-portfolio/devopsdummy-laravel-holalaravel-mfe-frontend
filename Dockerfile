# Imagen base
FROM php:8.2-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instalar Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Crear el directorio de trabajo
WORKDIR /app/frontend

# Copiar archivos del proyecto
COPY . .

# RUN chown -R 0 /app/frontend/storage /app/frontend/bootstrap/cache

# RUN chmod -R 775 /app/frontend/storage /app/frontend/bootstrap/cache

# RUN chmod u=g /app/frontend/storage /app/frontend/bootstrap/cache

# Establece un usuario no root para el contenedor
# RUN chown -R www-data:www-data /app/frontend/storage /app/frontend/bootstrap/cache
# RUN chmod -R 775 /app/frontend/storage /app/frontend/bootstrap/cache
RUN chgrp -R 0 /usr

RUN chmod -R g=u /usr
# RUN chmod -R 777 /app

# Crear el archivo de base de datos SQLite
# RUN mkdir -p /app/frontend/database && touch /app/frontend/database/database.sqlite && \
#     chmod -R 775 /app/frontend/database

# USER www-data

# Instalar dependencias
RUN composer install --no-dev --optimize-autoloader

# Permisos para almacenamiento y caché
# RUN chown -R www-data:www-data /app/frontend/storage /app/frontend/bootstrap/cache

# Exponer el puerto 8009
EXPOSE 8009

# Comando para ejecutar el servidor Artisan
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8009"]
