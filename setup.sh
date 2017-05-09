#!/bin/bash

mkdir -p /etc/nginx/external

if [ -z ${DH_SIZE+x} ]
then
  DH_SIZE="512"
fi


DH="/etc/nginx/external/dh.pem"

if [ ! -e "$DH" ]
then
  openssl dhparam -out "$DH" $DH_SIZE > /dev/null 2>&1
fi

if [ ! -e "/etc/nginx/external/cert.pem" ] || [ ! -e "/etc/nginx/external/key.pem" ]
then
  openssl req -x509 -newkey rsa:4086 \
  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" \
  -keyout "/etc/nginx/external/key.pem" \
  -out "/etc/nginx/external/cert.pem" \
  -days 3650 -nodes -sha256 > /dev/null 2>&1
fi

exit 0;