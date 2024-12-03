FROM mariadb:10.5

ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=wordpress

COPY conf /etc/mysql/conf.d
COPY tools /docker-entrypoint-initdb.d

EXPOSE 3306

