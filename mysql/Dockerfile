FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=usmandb
ENV MYSQL_USER=usman
ENV MYSQL_PASSWORD=usman1

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3307
