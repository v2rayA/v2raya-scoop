taskkill.exe /IM v2rayaWin.exe /FI "status eq running" | Out-Null

$resetPWOptions = @("--lite", "--reset-password")
Start-Process "$(scoop prefix v2raya)\v2rayaWin.exe" -ArgumentList $resetPWOptions -WorkingDirectory "$env:TEMP" -WindowStyle Hidden -Wait

$startOptions = @("--lite", "--log-disable-timestamp", "--log-file v2raya.log")
Start-Process "$(scoop prefix v2raya)\v2rayaWin.exe" -ArgumentList $startOptions -WorkingDirectory "$env:TEMP" -WindowStyle Hidden

