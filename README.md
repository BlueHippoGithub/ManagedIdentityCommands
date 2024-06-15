# ManagedIdentityCommands

Create automation account
Install modules: ExchangeOnlineManagement, AzureAD, Microsoft.Graph.Authentication, Microsoft.Graph.Users

Create Runbook with connection script

Connect-MgGraph -Scopes "ApproleAssignment.ReadWrite.All"

$MIAppID = "OBJECT_ID_OF_IDENTITY" 
$GraphAppId = "00000003-0000-0000-c000-000000000000"
$GraphServicePrincipal = Get-MgServicePrincipal -All | Where-Object {$_.AppId -eq $GraphAppId}

$AppRole = $GraphServicePrincipal.AppRoles | Where-Object {$_.Value -eq "User.Read.All"}

New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $MIAppID -AppRoleId $AppRole.Id -PrincipalId $MIAppID -ResourceId $GraphServicePrincipal.Id


$params = @{
    ServicePrincipalId = $MIAppID # managed identity object id
    PrincipalId = $MIAppID # managed identity object id
    ResourceId = (Get-MgServicePrincipal -Filter "AppId eq '00000002-0000-0ff1-ce00-000000000000'").id # Exchange online
    AppRoleId = "dc50a0fb-09a3-484d-be87-e023b12c6440" # Exchange.ManageAsApp
}

New-MgServicePrincipalAppRoleAssignedTo @params
