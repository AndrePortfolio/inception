FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y mariadb-server
    
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

WORKDIR /var/run/mysqld
    
COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

EXPOSE 3306

USER mysql

ENTRYPOINT ["bash", "/tmp/script.sh"]