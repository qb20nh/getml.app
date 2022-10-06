Set-Location C:\Users\Server\Downloads
while($true) {
    Get-ChildItem | ForEach-Object -Process {
        if((Get-Content $_.Name -Stream Zone.Identifier) -notcontains "ZoneId=3"){
            Set-Content -Path $_.Name -Stream Zone.Identifier -Value '[ZoneTransfer]','ZoneId=3'
        }
    }
    Start-Sleep 1
}
