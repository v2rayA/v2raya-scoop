$options = @("--lite", "--log-disable-timestamp", "--log-file v2raya.log", "--config $(scoop prefix v2raya)\config")
Start-Process "$(scoop prefix v2raya)\v2raya.exe" -ArgumentList $options -WorkingDirectory "$env:TEMP" -WindowStyle Hidden
