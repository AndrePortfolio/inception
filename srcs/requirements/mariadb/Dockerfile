FROM mariadb:10.5

ENV MYSQL_ROOT_PASSWORD_FILE=/run/secrets/db_root_password
ENV MYSQL_DATABASE_FILE=/run/secrets/db_password

COPY conf /etc/mysql/conf.d
COPY tools /docker-entrypoint-initdb.d

EXPOSE 3306
