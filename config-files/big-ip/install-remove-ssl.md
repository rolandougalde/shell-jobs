# SSL certificate installation on F5 - BigIP

## Create a temporary certificate

- Under `System web interface` create a new certificate named as `t.domain.`.
- Import a previous compilated SSL file, containing the `CRT` and `Chain`.
- Import the `Private Key` file.
- On F5 SSL profiles, look for the  `*.domain` and point `CRT`, `Key` and `Chain` to `t.domain.`.
- SSH on F5 stand by server, edit `/config/bigip.conf`

## Remove past configuration

- Fisrt check Local Traffic > Profiles > SSL, then remove cerificate associations.
- Look for the right configuration lines, "ssl-cert", "ssl-csr" and "ssl-key".
- Delete three entries related to the old certificate:

*Cert*

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

- Run on SSH terminal, `tmsh load sys config verify`
- Run on SSH terminal, `tmsh load sys config`
- Check site: `https://domian.`

## Create new SSL

- Under `System` create a new certificate named as `*.domain.`.
- Import a previous compilated SSL file, containing the `CRT` and `Chain`.
- Import the `Private Key` file.
- On F5 SSL profiles, look for the  `t.domain` and point `CRT`, `Key` and `Chain` to `*.domain.`.
- SSH on F5 stand by server, edit, `/config/bigip.conf`

## Remove temporary configuration

- Delete three entries for the temporary certificate:

*Cert*

`
}
sys file ssl-cert /Common/\t.domain. {
    cache-path /config/filestore/files_d/Common_d/certificate_d/:Common:t.domain._70369_1
    revision 1
`

*CSR*

`
}
sys file ssl-csr /Common/\t.domain. {
    cache-path /config/filestore/files_d/Common_d/certificate_signing_request_d/:Common:t.domain._70364_1
    revision 1
    source-path /config/ssl/ssl.csr/t.domain.
`  

*Key*

`
}
sys file ssl-key /Common/\t.domain. {
    cache-path /config/filestore/files_d/Common_d/certificate_key_d/:Common:t.domain._70360_1
    revision 1
    source-path /var/run/key_mgmt/aVX2s6/ssl.key/t.domain.
`

## Apply configuration

- Run on SSH terminal, `tmsh load sys config verify`, if OK
- Run on SSH terminal, `tmsh load sys config`
- Check site: `https://domian.`
