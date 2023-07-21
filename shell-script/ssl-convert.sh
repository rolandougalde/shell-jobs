# SSL formats

openssl req -newkey rsa:2048 -keyout [key-name].key -out [request-name].csr

openssl pkcs12 -export -out [domain-name].pfx -inkey [domain-name].key -in [domain-name].crt -certfile bundle.[domain-name].crt
