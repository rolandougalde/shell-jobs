# Grant send on behalf of a group

Get-DistributionGroup "[group-name]" | fl name,grant*

Set-DistributionGroup "[group-name]" -GrantSendOnBehalfTo "[team-name]"

Add-RecipientPermission "[group-name]" -AccessRights SendAs -Trustee "[user-name]"

Set-DistributionGroup "[group-name]" -GrantSendOnBehalfTo "[user-name]"
