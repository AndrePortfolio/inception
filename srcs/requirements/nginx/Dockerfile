FROM debian:buster

RUN apt update; \
    apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/andre-da.key \
    -out /etc/ssl/certs/andre-da.crt \
    -subj="/C=PT/ST=lisbon/L=Beato/O=42 School/OU=andre-da/CN=andre-da.42.fr"

COPY ./tools/certs.sh /tmp/certs.sh

RUN chmod +x /tmp/certs.sh

COPY ./conf/default /etc/nginx/sites-available/default

ENTRYPOINT ["/tmp/certs.sh"]