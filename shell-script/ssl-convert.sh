#!/bin/bash

# This script was designed for a SSL certificates delivery pipeline

# Read file names

# Set variables
year="date +%Y"
dname="domain-name"
csrfile="domain-name.csr"
keyfile="domain-name.key"
crtfile="ba256bfc8f0bcfec.crt"
bdlfile="gd_bundle-g2-g1.crt"
pfxfile=("$year + '.' + $dname + '.pfx'")
wdcfile=("$year + '.' + $dname + '.crt'")

# Decompress CA file
unzip *.zip

# Concatante on a single file
cat $crtfile $bdlfile $keyfiley >  $wdcfile

# Convert certificate to PKCS12/PFX
openssl pkcs12 -export -out $pfxfile -inkey $keyfile -in wdcfile -certfile $bdlfile

# exit0
