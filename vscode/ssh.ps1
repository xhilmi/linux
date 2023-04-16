$hostServer = Read-Host "Enter the host server"
$user = Read-Host "Enter the username"
$port = Read-Host "Enter the port number"

$targetHost = "$user@$hostServer"
$pubkeyPath = "$HOME/.ssh/id_rsa.pub"
$pubKey = (Get-Content "$pubkeyPath" | Out-String); ssh -p $port "$targetHost" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '${pubKey}' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
