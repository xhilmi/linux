# Auto Connect SSH Without Repeatedly Input Password in Visual Code

1. Open VS Code

2. Install extension Remote SSH 
 
3. Run ssh-keygen on terminal VS Code then just hit enter (powershell)
```
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa <<< y
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

5. Or you could run this command below on your CMD / PowerShell <br>
`powershell -command "& {Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/xhilmi/linux/master/vscode/ssh.ps1'))}"`

#### Reference : https://krisnayuda.wordpress.com/2020/09/07/tips-ssh-vs-code/

# Usable Extension

- Docker: https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker	
- Docker Explorer: https://marketplace.visualstudio.com/items?itemName=formulahendry.docker-explorer
- Hacker Theme: https://marketplace.visualstudio.com/items?itemName=thorerik.hacker-theme
- Hallows Theme: https://marketplace.visualstudio.com/items?itemName=konapun.all-hallows-eve-plus
- Indent One Space: https://marketplace.visualstudio.com/items?itemName=usernamehw.indent-one-space
- Kubernetes Highlighter: https://marketplace.visualstudio.com/items?itemName=dag-andersen.kubernetes-reference-highlighter
- Kubernetes Support: https://marketplace.visualstudio.com/items?itemName=ipedrazas.kubernetes-snippets
- Kubernetes Templates: https://marketplace.visualstudio.com/items?itemName=lunuan.kubernetes-templates
- Material Icon Theme: https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme
- Material Theme Icons: https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme-icons
- Terraform: https://marketplace.visualstudio.com/items?itemName=4ops.terraform
- Terraform Hashicorp: https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
- WSL: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl
- YAML: https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml
