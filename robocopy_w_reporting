# Cheap Robocopy w/ reporting

robocopy D:\ \\192.168.1.5\share\ /mir /e /FFT /r:5 /w:1 /z /b /ts /LOG:C:\Users\admin\Desktop\Robolog\robolog.txt

$time = (Get-Date).ToString("yyyyMMdd") 

cd C:\Users\admin\Desktop\Robolog\

$LOG = Get-Content robolog.txt | Select-Object -Last 14 | Out-File robolog.$time.txt

$From = "device@email.com"
$To = "rep@email.com"
$Cc = "cc@email.com"
$Attachment = "C:\Users\admin\Desktop\Robolog\robolog.$time.txt"
$Subject = "Subject"
$Body = "Backup task complete. See attachment."
$MailRly = "ip.addr"

Send-MailMessage -To $To -Subject $Subject -Body $Body -SmtpServer $MailRly -From $From -Cc $CC -Attachment $Attachment

Remove-Item .\robolog.txt
