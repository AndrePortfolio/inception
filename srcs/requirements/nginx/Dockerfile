# Use a base image (Alpine recommended for small size)
FROM alpine:3.17

# Install necessary packages
RUN apk update && apk add --no-cache nginx openssl

# Create directory for SSL certificates and configuration
RUN mkdir -p /etc/nginx/certs /etc/nginx/conf.d

# Generate self-signed SSL certificates
RUN openssl req -x509 -newkey rsa:4096 -days 365 -nodes \
    -keyout /etc/nginx/certs/nginx.key \
    -out /etc/nginx/certs/nginx.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=IT Department/CN=andre.42.fr"

# Copy custom NGINX configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/mime.types /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
EXPOSE 443

# Start NGINX in foreground
CMD ["nginx", "-g", "daemon off;"]
