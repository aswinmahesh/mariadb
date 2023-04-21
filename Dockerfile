# Use a minimal Alpine-based image as a parent image
FROM alpine:3.14

# Install MariaDB client and server
RUN apk add --no-cache mariadb mariadb-client

# Copy the custom configuration file to the container
COPY my.cnf /etc/mysql/my.cnf

# Set the default command to run when the container starts
CMD ["mysqld"]

# Expose the default MariaDB port
EXPOSE 3306
