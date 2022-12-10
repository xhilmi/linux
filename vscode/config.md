# Auto Connect SSH Without Repeatedly Input Password in Visual Code
#### URL : https://krisnayuda.wordpress.com/2020/09/07/tips-ssh-vs-code/

1. Install SSH - Remote

2. Run ssh-keygen on terminal VS Code then just hit enter
```
$ ssh-keygen -t rsa
```

3. Run this function on terminal VS Code
```
$targetHost="username@hostserver.com"
$pubkeyPath="$HOME/.ssh/id_rsa.pub"
$pubKey=(Get-Content "$pubkeyPath" | Out-String); ssh -p 22 "$targetHost" "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '${pubKey}' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```
