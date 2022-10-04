# Lockdown clients<!--
<#--><style>
body {
    white-space: pre;
    font-family: monospace;
}
</style><!--#>#-->

# download policy templates
iwr https://dl.google.com/dl/edgedl/chrome/policy/policy_templates.zip -outfile chrome_policy_templates.zip
iwr https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/122fe460-3256-4ab3-99b2-d6f358dd4a44/MicrosoftEdgePolicyTemplates.cab -outfile edge_policy_templates.cab
# extract archives
start -wait expand.exe -args "edge_policies.cab /f:*.zip edge_policy_templates.zip"
Expand-Archive .\chrome_policy_templates.zip
Expand-Archive .\edge_policy_templates.zip
# install policy templates
Copy-Item -Path .\edge_policy_templates\windows\admx\*,.\chrome_policy_templates\windows\admx\* -Destination "$env:systemroot\PolicyDefinitions"

# download policy settings
iwr https://getml.app/res/GroupPolicy.zip -outfile GroupPolicy.zip
# extract
Expand-Archive .\GroupPolicy.zip
# apply policy settings
Copy-Item -Path .\GroupPolicy\* -Destination "$env:systemroot\System32\GroupPolicy\"

# $username = 'username'
# $password = 'password'

# $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
# $credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
# Start-Process powershell.exe -Credential $credential
