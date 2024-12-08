FROM debian:oldstable

# Install dependencies
RUN apt update && apt install -y nginx openssl

# Generate SSL certificates dynamically
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/andre-da.key \
    -out /etc/ssl/certs/andre-da.crt \
    -subj="/C=PT/ST=Lisbon/L=Beato/O=42 School/OU=andre-da/CN=andre-da.42.fr"

# Copy necessary files
COPY ./tools/certs.sh /tmp/certs.sh
RUN chmod +x /tmp/certs.sh

COPY ./conf/default /etc/nginx/sites-available/default

# Set the entry point
ENTRYPOINT ["/tmp/certs.sh"]