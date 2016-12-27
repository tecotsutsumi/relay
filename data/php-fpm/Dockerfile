FROM php:7.0-fpm

#install libraries
RUN apt-get update && apt-get install -y \
  git \
  libicu-dev \
  unzip \
  zip
RUN docker-php-ext-install \
  intl \
  pdo_mysql

#install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '61069fe8c6436a4468d0371454cf38a812e451a14ab1691543f25a9627b97ff96d8753d92a00654c21e2212a5ae1ff36') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

#config file
COPY www.conf /etc/php-fpm.d/www.conf

CMD ["php-fpm"]