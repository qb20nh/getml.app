# Lockdown clients<!--
<#--><style>
body {
    white-space: pre;
    font-family: monospace;
}
</style><!--#>#-->

$OriginalPR = $ProgressPreference

$ProgressPreference = 'SilentlyContinue'

Set-Location ~/Downloads

# test admin
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()

$principal = New-Object Security.Principal.WindowsPrincipal $identity

$IsAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

if ($IsAdmin) {

# download policy templates
Write-Host -NoNewline "1/6 Downloading policy templates..."
Invoke-WebRequest https://dl.google.com/dl/edgedl/chrome/policy/policy_templates.zip -outfile chrome_policy_templates.zip
Invoke-WebRequest https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/122fe460-3256-4ab3-99b2-d6f358dd4a44/MicrosoftEdgePolicyTemplates.cab -outfile edge_policy_templates.cab
Write-Host "Done"
# extract archives
Write-Host -NoNewline "2/6 Installing policy templates..."
Start-Process -Wait expand.exe -Args "edge_policy_templates.cab /f:*.zip edge_policy_templates.zip"
Expand-Archive .\chrome_policy_templates.zip -Force
Expand-Archive .\edge_policy_templates.zip -Force
# install policy templates
Copy-Item -Path .\edge_policy_templates\windows\admx\*,.\chrome_policy_templates\windows\admx\* -Destination "$env:systemroot\PolicyDefinitions" -Recurse -Force
Write-Host "Done"

# download policy settings
Write-Host -NoNewline "3/6 Downloading policy settings..."
Invoke-WebRequest https://getml.app/res/GroupPolicy.zip -outfile GroupPolicy.zip
Write-Host "Done"
# extract
Write-Host -NoNewline "4/6 Applying policy settings..."
Expand-Archive .\GroupPolicy.zip -Force
# apply policy settings
Copy-Item -Path .\GroupPolicy\* -Destination "$env:systemroot\System32\GroupPolicy\" -Recurse -Force
Write-Host "Done"

# download security policy
Write-Host -NoNewline "5/6 Downloading security policy settings..."
Invoke-WebRequest https://getml.app/res/secpol.inf -outfile secpol.inf
Write-Host "Done"
# apply policy settings
Write-Host -NoNewline "6/6 Applying security policy settings..."
Start-Process -Wait secedit.exe -Args "/configure /db %windir%\security\local.sdb /cfg $pwd\secpol.inf"
Write-Host "Done"

} else {
    Start-Process -Wait powershell -Verb RunAs -Args "-command 'iwr getml.app/lockdown | iex'"
}

$ProgressPreference = $OriginalPR

# $username = 'username'
# $password = 'password'

# $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
# $credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
# Start-Process powershell.exe -Credential $credential
