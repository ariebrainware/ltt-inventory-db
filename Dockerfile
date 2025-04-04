# Use the official MySQL image as base.
FROM mysql:latest

LABEL maintainer="Arie Brainware"

# Set required environment variables.
ENV GOSU_VERSION=1.17 \
    MYSQL_MAJOR=innovation \
    MYSQL_VERSION=9.2.0-1.el9 \
    MYSQL_ROOT_PASSWORD=u0X89bojF8uQjrb \
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    MYSQL_PASSWORD=mZWBMpZQfhk22nK \
    MYSQL_SHELL_VERSION=9.2.0-1.el9 \
    MYSQL_DATABASE=ltt_inventory \
    MYSQL_USER=ltt_dbadmin \
    TZ=Asia/Jakarta \
    MYSQL_DATA_DIR=/var/lib/mysql \
    RESTART=always

# Set the container to use a specific network.
ENV NETWORK=ltt-inventory-network \
    IP=192.168.1.10

# Mount /var/lib/mysql to a persistent volume ensuring your data remains intact across container restarts.
VOLUME ["/var/lib/mysql"]

# Explicitly expose only port 33061.
EXPOSE 33061

# Use the default MySQL command.
CMD ["mysqld"]
