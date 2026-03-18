FROM debian:12
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sed -i 's/^#user\s*=.*/user = root/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i 's/^#datadir\s*=.*/datadir = \/var\/lib\/mysql/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i 's/^#tmpdir\s*=.*/tmpdir = \/tmp/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i 's/^bind-address\s*=.*/bind-address=  0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 3306
ENTRYPOINT ["./start.sh"]
