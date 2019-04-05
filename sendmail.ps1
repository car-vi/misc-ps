$From = "email@email"
$To = "email@email"
$Cc = "email@email"
#$Attachment = "C:\users\Username\Documents\SomeTextFile.txt"
$Subject = "Test"
$Body = "Test"
$SMTPServer = "smtp_server"
$SMTPPort = "25"
#-UseSsl
#-Credential (Get-Credential)
#–DeliveryNotificationOption OnSuccess
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort
