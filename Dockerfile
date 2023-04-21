FROM mariadb:latest

ADD sql/ /docker-entrypoint-initdb.d

ENV MYSQL_ROOT_PASSWORD test123
ENV MYSQL_DATABASE testDB
ENV MYSQL_USER toto
ENV MYSQL_PASSWORD test123

RUN apt-get update && apt-get -y install vim

EXPOSE 3306

CMD ["mysqld"]
