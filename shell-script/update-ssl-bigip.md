# SSL certificate installation on F5 - BigIP

## Create a temporary certificate

- Under `System` create a new certificate named as `t.domain.`.
- Import a previous compilated SSL file, containing the `CRT` and `Chain`.
- Import the `Private Key` file.
- On F5 SSL profiles, look for the  `*.domain` and point `CRT`, `Key` and `Chain` to `t.domain.`.
- SSH on F5 stand by server, edit, `/config/bigip.conf`

## Remove past configuration

- Delete three entries for the old certificate:

*Common*
`
}
sys file ssl-cert /Common/\*.domain. {
    cache-path /config/filestore/files_d/Common_d/certificate_d/:Common:*.domain._70369_1
    revision 1
`

*CSR*
`
}
sys file ssl-csr /Common/\*.domain. {
    cache-path /config/filestore/files_d/Common_d/certificate_signing_request_d/:Common:*.domain._70364_1
    revision 1
    source-path /config/ssl/ssl.csr/*.domain.
`  

*Key*
`
}
sys file ssl-key /Common/\*.domain. {
    cache-path /config/filestore/files_d/Common_d/certificate_key_d/:Common:*.domain._70360_1
    revision 1
    source-path /var/run/key_mgmt/aVX2s6/ssl.key/*.domain.
`
## Verify configuration

- Run on SSH terminal, `tmsh load sysconfig verify`

## Create new SSL

- Under `System` create a new certificate named as `*.domain.`.
- Import a previous compilated SSL file, containing the `CRT` and `Chain`.
- Import the `Private Key` file.
- On F5 SSL profiles, look for the  `t.domain` and point `CRT`, `Key` and `Chain` to `*.domain.`.
- SSH on F5 stand by server, edit, `/config/bigip.conf`

## Remove temporary configuration

- Delete three entries for the temporary certificate:
`sys file ssl-key /Common/\t.domain.

## Apply configuration

- Run on SSH terminal, `tmsh load sysconfig verify`, if OK
- Run on SSH terminal, `tmsh load sysconfig`
- Check site: https://domian.