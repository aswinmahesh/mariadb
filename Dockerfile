# Build container
FROM alpine:3.14 AS builder

# Install build dependencies
RUN apk add --no-cache build-base mariadb-dev

# Download and extract the MariaDB source code
WORKDIR /tmp
RUN wget https://downloads.mariadb.org/f/mariadb-10.6.5/source/mariadb-10.6.5.tar.gz \
    && tar xzf mariadb-10.6.5.tar.gz

# Build MariaDB from source
WORKDIR /tmp/mariadb-10.6.5
RUN cmake . \
    && make -j$(nproc) \
    && make install DESTDIR=/tmp/install

# Final container
FROM alpine:3.14

# Copy the MariaDB binaries from the build container
COPY --from=builder /tmp/install /

# Copy the custom configuration file to the container
COPY my.cnf /etc/mysql/my.cnf

# Set the default command to run when the container starts
CMD ["mysqld"]

# Expose the default MariaDB port
EXPOSE 3306
