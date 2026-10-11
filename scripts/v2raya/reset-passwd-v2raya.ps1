taskkill.exe /IM 'v2raya.exe' /FI "status eq running" | Out-Null

$resetPWOptions = @("--lite", "--reset-password", "--config $(scoop prefix v2raya)\config")
Start-Process "$(scoop prefix v2raya)\v2raya.exe" -ArgumentList $resetPWOptions -WorkingDirectory "$env:TEMP" -WindowStyle Hidden -Wait

$startOptions = @("--lite", "--log-disable-timestamp", "--log-file v2raya.log", "--config $(scoop prefix v2raya)\config")
Start-Process "$(scoop prefix v2raya)\v2raya.exe" -ArgumentList $startOptions -WorkingDirectory "$env:TEMP" -WindowStyle Hidden

