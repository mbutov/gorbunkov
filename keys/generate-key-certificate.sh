#!/bin/sh

rm -f android-sign.*

openssl genrsa -out android-sign.key 2048

#openssl genpkey -out android-sign.pk8 -algorithm RSA -pkeyopt rsa_keygen_bits:2048

openssl pkcs8 -topk8 -nocrypt -inform PEM -outform DER -in android-sign.key -out android-sign.pk8
#openssl pkcs8 -topk8 -in android-sign.key -passout pass:password -out android-sign.pk8

openssl req -new \
  -x509 -days 14610 \
  -subj '/CN=Unknown/O=Unknown/L=Minsk/C=BY' \
  -key android-sign.key \
  -out android-sign.crt

openssl x509 -in android-sign.crt -text > android-sign.crt.txt
