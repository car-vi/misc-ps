##################################
#                                #
# Written by Carlos Vieyra - DCR #
#                                #
##################################

###            NOTES            ###
###
### RUN WITH ELEVATED PRIV/XA ###
###
### HostNames.csv must be in the same directory as the script ###
###


$IPDB = import-csv '.\HostNames.csv' -header IP -Delimiter ','
foreach ($ip in $IPDB)
{
$ip = $($ip.IP)
Get-WmiObject -Class Win32_processor -ComputerName $ip | Format-Table -Property systemname,DeviceID,NumberOfCores,NumberOfLogicalProcessors >> temp.txt
wmic /NODE:"$ip" os get caption
}

(Get-Content .\temp.txt -Raw) | foreach { $_ -replace "-",""} | foreach { $_ -replace "systemname",""} | foreach { $_ -replace "DeviceID",""} | foreach { $_ -replace "NumberOfCores",""} | foreach { $_ -replace "NumberOfLogicalProcessors",""} | Set-Content .\CPU_INFO.txt
"ServerName   CPUID NumberOfCores NumberOfLogicalProcessors" + (Get-Content .\CPU_INFO.txt -Raw) | Set-Content .\CPU_INFO.txt

rm -force .\temp.txt

(gc .\CPU_INFO.txt) | ? {$_.trim() -ne "" } | set-content .\CPU_INFO.txt

 