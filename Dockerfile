FROM alpine:latest
LABEL maintainer="Marco Gordillo <marcopgordillo@gmail.com>" \
  description="This example Dockerfile installs PHP-FPM." \
  version="1.0"

RUN apk update && \
  apk upgrade && \
  apk add --update php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-common php7-mbstring php7-xmlrpc php7-soap php7-gd php7-xml php7-intl php7-cli php7-ldap php7-zip && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /usr/share/nginx/html && \
  #  sed -i "s/;listen.allowed_clients = 127.0.0.1/listen.allowed_clients = nginx/" /etc/php7/php-fpm.d/www.conf && \
  #echo 'catch_workers_output = yes' >> /etc/php7/php-fpm.d/www.conf && \
  #echo 'php_flag[display_errors] = on' >> /etc/php7/php-fpm.d/www.conf && \
  #echo 'php_admin_value[error_log] = /var/log/fpm-php.www.log' >> /etc/php7/php-fpm.d/www.conf && \
  #echo 'php_admin_flag[log_errors] = on' >> /etc/php7/php-fpm.d/www.conf && \
  sed -i "s/listen = 127.0.0.1:9000/listen = 9000/" /etc/php7/php-fpm.d/www.conf

#COPY files/nginx.conf /etc/nginx/nginx.conf
#COPY files/default.conf /etc/nginx/conf.d/default.conf
#ADD files/html.tar.gz /usr/share/nginx/

EXPOSE 9000/tcp

# ENTRYPOINT ["nginx"]
CMD ["php-fpm7", "-F"]

