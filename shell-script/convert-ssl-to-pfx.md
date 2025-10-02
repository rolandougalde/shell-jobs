# Convert Comodo SSL certificate from .PEM to .PFX

> With default parameters 
```bash
openssl pkcs12 -export -out "star-domain.com.pfx" -inkey "star-domain.com.key" -in "star-domain.com.crt" -certfile "CA-domain.com.crt"
```

> with legacy features like SHA1

```bash
openssl pkcs12 -export -out "star-domain.com.pfx" -inkey "star-domain.com.key" -in "star-domain.com.crt" -certfile "CA-domain.com.crt" -legacy
```
