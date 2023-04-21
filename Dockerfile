FROM mariadb:latest

# Copy a custom MySQL configuration file to the container
COPY my.cnf /etc/mysql/conf.d/

# Copy a custom entrypoint script to the container
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose the default MariaDB port
EXPOSE 3306

# Set the default command to run when the container starts
CMD ["mysqld"]
