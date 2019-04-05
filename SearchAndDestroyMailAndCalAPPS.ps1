
$ChAPP = Get-AppxPackage *microsoft.windowscommunicationsapps*
$RemAPP = Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage

if([string]::IsNullOrEmpty($ChAPP)){
    Write-Host "NULL";
}else {
    Write-Host "Not NULL";
    $RemAPP
}
