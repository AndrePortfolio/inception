FROM debian:oldstable

RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    apt-get clean

COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

WORKDIR /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["bash", "/tmp/script.sh"]