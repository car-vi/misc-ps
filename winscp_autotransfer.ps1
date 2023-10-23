try
{
 
    # Load WinSCP .NET assembly
    Add-Type -Path "WinSCPnet.dll"

    # Setup session options
    $sessionOptions = New-Object WinSCP.SessionOptions

    $sessionOptions.Protocol = [WinSCP.Protocol]::Sftp
    $sessionOptions.HostName = "10.XX.XX.XX"
    $sessionOptions.UserName = "srvXXXXXXXX"
    $sessionOptions.SecurePassword = ConvertTo-SecureString"273737737373"
    $sessionOptions.SshHostKeyFingerprint = "ssh-rsa 2048 XXXXXXXXXXXXXX"
    $session = New-Object WinSCP.Session

  
    # Connect
    $session.Open($sessionOptions)
 
    # Transfer files
    $session.PutFiles("C:\Test\*.txt", "/XXX/*").Check()
    }
finally
{
    $session.Dispose()
}
