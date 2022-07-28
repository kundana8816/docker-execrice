FROM node:14 AS sass
WORKDIR /example
RUN npm install -g node-sass
COPY example.scss .
RUN node-sass example.scss example.css
 
FROM php:8.0-apache
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
COPY composer.json .
COPY composer.lock .
RUN composer install --no-dev
COPY --from=sass /example/example.css example.css
COPY index.php .
COPY src/ src