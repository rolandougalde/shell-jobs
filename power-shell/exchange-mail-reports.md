# Exchange 2010 e-mail reports

Listing sent e-mails

```powershell
Get-MessageTrackingLog -Start "10/23/2025" -End "10/24/2025" -Sender  user@heritagesports.com  > user-emails-today.csv
```
