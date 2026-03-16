FROM debian:12
RUN apt-get update && apt-get install -y php-fpm php-mysql php-gd curl && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/www/html
RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/wordpress-6.9.4.tar.gz \
	&& tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 \
	&& rm /tmp/wordpress.tar.gz
RUN chown -R www-data:www-data /var/www/html
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf
EXPOSE 9000
CMD ["php-fpm8.2", "-F"]
