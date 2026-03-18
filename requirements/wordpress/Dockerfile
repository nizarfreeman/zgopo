FROM debian:12
RUN apt-get update && apt-get install -y --no-install-recommends \
    php-fpm php-mysql php-gd ca-certificates wget curl default-mysql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /usr/local/bin/wp
RUN mkdir -p /var/www/html
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 9000
ENTRYPOINT ["/start.sh"]
