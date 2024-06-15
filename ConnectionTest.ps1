$org = ".onmicrosoft.com"
Connect-ExchangeOnline -ManagedIdentity -Organization $org

$mailboxes = Get-Mailbox
if($mailboxes){
	Write-Output "Mailboxes fetched with ExchangeOnline"
}

Connect-AzAccount -Identity
$aadUsers = Get-AzADUser
if($aadUsers){
	Write-Output "Users fetched with Az AD"
}

Connect-MgGraph -Identity
$graphUsers = Get-MgUser
if($graphUsers){
	Write-Output "Users fetched with Graph"
}