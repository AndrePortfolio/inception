#!/bin/bash

sed -i "s|my_cert|${SSL_CERT_PATH}|g" /etc/nginx/sites-available/default
sed -i "s|my_key|${SSL_KEY_PATH}|g" /etc/nginx/sites-available/default
sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/sites-available/default

nginx -g "daemon off;"