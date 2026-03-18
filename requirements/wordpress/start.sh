#!/bin/bash
sleep 20

set -e

cd /var/www/html

echo "[1/5] Checking WordPress installation..."

if [ ! -f wp-config.php ]; then

    echo "[2/5] Downloading WordPress..."
    wget -q -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1
    rm /tmp/wordpress.tar.gz
    echo "[2/5] WordPress ready."

echo "[3/5] Waiting for MariaDB..."

until mysql -h mariadb -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SELECT 1;" >/dev/null 2>&1; do
    echo "[3/5] MariaDB not ready yet..."
   	sleep 2
	done

echo "[3/5] MariaDB is ready."
    echo "[4/5] Creating wp-config.php..."
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="mariadb" \
        --allow-root
    echo "[4/5] wp-config.php created."

    echo "[5/5] Installing WordPress..."
    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="inception" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email \
        --allow-root
    echo "[5/5] WordPress installed."

    echo "[+] Creating additional user..."
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}" \
        --role=author \
        --allow-root
    echo "[+] User created."

else
    echo "[2/5] WordPress already installed — skipping setup."
fi

echo "[✔] Starting PHP-FPM..."
exec php-fpm8.2 -F
