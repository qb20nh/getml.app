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
Invoke-WebRequest https://dl.google.com/dl/edgedl/chrome/policy/policy_templates.zip -outfile chrome_policy_templates.zip
Invoke-WebRequest https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/122fe460-3256-4ab3-99b2-d6f358dd4a44/MicrosoftEdgePolicyTemplates.cab -outfile edge_policy_templates.cab
# extract archives
Start-Process -Wait expand.exe -Args "edge_policies.cab /f:*.zip edge_policy_templates.zip"
Expand-Archive .\chrome_policy_templates.zip
Expand-Archive .\edge_policy_templates.zip
# install policy templates
Copy-Item -Path .\edge_policy_templates\windows\admx\*,.\chrome_policy_templates\windows\admx\* -Destination "$env:systemroot\PolicyDefinitions"

# download policy settings
Invoke-WebRequest https://getml.app/res/GroupPolicy.zip -outfile GroupPolicy.zip
# extract
Expand-Archive .\GroupPolicy.zip
# apply policy settings
Copy-Item -Path .\GroupPolicy\* -Destination "$env:systemroot\System32\GroupPolicy\"

} else {
    Start-Process -Wait powershell -Verb RunAs -Args "-command 'iwr getml.app/lockdown | iex'"
}

$ProgressPreference = $OriginalPR

# $username = 'username'
# $password = 'password'

# $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
# $credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
# Start-Process powershell.exe -Credential $credential
