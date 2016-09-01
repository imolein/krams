#!/bin/bash

domain=$1
year=$(date +%Y)

# Zertifikatangaben
country=
state=
locality=
organization=
organizationalunit=
commonname=
email=

pass=$(dd if=/dev/urandom count=1024 < /dev/null | tr -cd "[:alnum:]" | head -c 20)

if [ -z "$domain" ]; then
    echo "generate-csr.sh example.com"
    exit 1
fi

if [ ! -d "$year" ]; then
	mkdir $year
fi

echo "Erstelle Privat Key für $domain"
openssl genrsa -des3 -passout pass:$pass -out $year/$domain.key 4096 -noout

echo "Entferne Passwort aus Privat Key"
openssl rsa -in $year/$domain.key -passin pass:$pass -out $year/$domain.key

echo "Erstelle CSR"
openssl req -new -key $year/$domain.key -out $year/$domain.csr -passin pass:$pass \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

exit 0
