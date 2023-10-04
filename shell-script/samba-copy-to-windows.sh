#!/bin/bash

smbclient '//destination/folder' -U "DOMAINNAME\username" -c "put backup_20231004164907.tar.gz backup_20231004164907.tar.gz" -m SMB2

smbclient '//destination/folder' -U "DOMAINNAME\username" -c "put backup_20231004164907.tar.gz backup_20231004164907.tar.gz" -m SMB3

smbclient '//xxx.xxx.xxx.xxx/tmp' -U Administrator -c "put /home/user/notes.txt home-folder-user" -m SMB3

smbclient '%smbPath%' '%smbPassword%' -W %domain% -U %smbUser% -c 'prompt OFF; recurse OFF; cd %smbSource%; lcd tomcat/conf; mget *'
