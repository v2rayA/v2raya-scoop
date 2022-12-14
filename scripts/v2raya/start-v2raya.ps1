$options = @("--lite", "--log-disable-timestamp", "--log-file v2raya.log")
Start-Process "$(scoop prefix v2raya)\v2rayaWin.exe" -ArgumentList $options -WorkingDirectory "$env:TEMP" -WindowStyle Hidden -Wait
