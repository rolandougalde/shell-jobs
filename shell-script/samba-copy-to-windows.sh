#!/bin/bash

smbclient '//destination/folder' -U "DOMAINNAME\username" -c "put backup_20231004164907.tar.gz backup_20231004164907.tar.gz" -m SMB2

smbclient '//destination/folder' -U "DOMAINNAME\username" -c "put backup_20231004164907.tar.gz backup_20231004164907.tar.gz" -m SMB3
