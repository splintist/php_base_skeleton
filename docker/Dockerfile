ARG ENVIRONMENT=dev

FROM php:8.1-apache as app_base

MAINTAINER Thomas Neumann <>

RUN apt-get update
   #extensions and packages here
   #&& apt-get install -y libpq-dev \
   #&& docker-php-ext-install pgsql


ENV APACHE_DOCUMENT_ROOT /var/www/web
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite

COPY . /var/www/
WORKDIR /var/www/


FROM app_base as app-dev
RUN echo "build dev"

# Use the default development configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

#Use dev-php-ini (Uncomment to use this)
#COPY docker/php/dev-php.ini $PHP_INI_DIR/php.ini

#Use dev-apache-config
RUN rm /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/000-default.conf
COPY docker/apache/dev-000-default.conf /etc/apache2/sites-available/000-default.conf

#install debugger
#RUN pecl install xdebug-3.1.2 \
#    && docker-php-ext-enable xdebug \

RUN curl -fsSL 'https://xdebug.org/files/xdebug-3.1.2.tgz' -o xdebug.tar.gz \
    && mkdir -p xdebug \
    && tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
    && rm xdebug.tar.gz \
    && ( \
      cd xdebug \
      && phpize \
      && ./configure --enable-xdebug \
      && make -j "$(nproc)" \
      && make install \
    ) \
    && rm -r xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug" >> $PHP_INI_DIR/php.ini \
    && echo "xdebug.client_host=172.17.0.1" >> $PHP_INI_DIR/php.ini \
    #&& echo "xdebug.client_host=host.docker.internal" >> $PHP_INI_DIR/php.ini \ //Windows/Mac
    && echo "xdebug.idekey=PHPSTORM" >> $PHP_INI_DIR/php.ini \
    && echo "display_errors = On" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_startup_errors = On" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "error_reporting = E_ALL" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

FROM app_base as app-staging
RUN echo "build staging"

# Use the default development configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

#Use staging-php-ini (Uncomment to use this)
#COPY docker/php/staging-php.ini $PHP_INI_DIR/php.ini

#Use staging-apache-config
RUN rm /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/000-default.conf
COPY docker/apache/staging-000-default.conf /etc/apache2/sites-available/000-default.conf

FROM app_base as app-prod
RUN echo "build prod"

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

#Use prod-php-ini (Uncomment to use this)
#COPY docker/php/prod-php.ini $PHP_INI_DIR/php.ini

#Use prod-apache-config
RUN rm /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/000-default.conf
COPY docker/apache/prod-000-default.conf /etc/apache2/sites-available/000-default.conf


#Hardening
RUN rm -rf docker \
    && rm -rf test \
    && rm -rf bin \
    && rm -rf .idea \
    && rm -rf .git \
    && rm phpunit.xml

FROM app-${ENVIRONMENT} as app_final
RUN echo "final buildsteps"