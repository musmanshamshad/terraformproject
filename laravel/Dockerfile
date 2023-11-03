FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev

RUN a2enmod rewrite

COPY custom.conf /etc/apache2/sites-available/custom.conf

RUN a2ensite custom.conf

RUN a2dissite 000-default
RUN service apache2 restart

RUN mkdir -p /phpdocker/temp12

WORKDIR /phpdocker/temp12

RUN git clone https://github.com/musmanshamshad/temp12.git .

COPY .env /phpdocker/temp12

RUN chmod -R 755 /phpdocker/temp12/public

RUN chown -R www-data:www-data /phpdocker/temp12/storage /phpdocker/temp12/bootstrap/cache



RUN curl -o /usr/local/bin/wait-for-it https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod +x /usr/local/bin/wait-for-it

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

RUN docker-php-ext-install pdo pdo_mysql zip

RUN composer install

ENV APP_ENV=local

RUN php artisan key:generate

RUN php artisan config:cache

#RUN php artisan migrate

EXPOSE 80



#CMD ["apache2-foreground"]
