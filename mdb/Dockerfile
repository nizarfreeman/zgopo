FROM debian:12
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 3306
ENTRYPOINT ["/start.sh"]
