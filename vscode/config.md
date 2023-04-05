# Auto Connect SSH Without Repeatedly Input Password in Visual Code

1. Open VS Code

2. Install extension Remote SSH 
 
3. Run ssh-keygen on terminal VS Code then just hit enter (powershell)
```
$ ssh-keygen -t rsa
```

4. Run this function on terminal VS Code
```
$hostServer = Read-Host "Enter the host server"
$user = Read-Host "Enter the username"
$port = Read-Host "Enter the port number"

$targetHost = "$user@$hostServer"
$pubkeyPath = "$HOME/.ssh/id_rsa.pub"
$pubKey = (Get-Content "$pubkeyPath" | Out-String); ssh -p $port "$targetHost" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '${pubKey}' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

#### Reference : https://krisnayuda.wordpress.com/2020/09/07/tips-ssh-vs-code/
