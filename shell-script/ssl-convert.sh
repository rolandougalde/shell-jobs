#!/bin/bash

# This script is intended for a SSL certificates delivery pipeline

# Decompress CA file
unzip *.zip
# Read file names

# Set variables

 # Concatante on a single file
cat ba256bfc8f0bcfec.crt gd_bundle-g2-g1.crt [domain-name].eu.key > 2024.wildcard.[domain-name].eu.crt

# Convert certificate to PKCS12/PFX
openssl pkcs12 -export -out 2024.wildcard.[domain-name].eu.pfx -inkey [domain-name].eu.key -in ba256bfc8f0bcfec.crt # -certfile bundle.[domain-name].crt

exit 0
