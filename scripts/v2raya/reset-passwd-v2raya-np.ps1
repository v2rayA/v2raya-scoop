# sc stop v2rayA
Get-Service -Name v2rayA | Stop-Service -Force -Verbose

# &'./bin/v2raya.exe' --lite --reset-password --config "./""
$options = @("--lite", "--reset-password", "--config $(scoop prefix v2raya-np)")
Start-Process "$(scoop prefix v2raya-np)/bin/v2raya.exe" --ArgumentList $options -WindowStyle Hidden -Wait -Verb RunAs

# sc start v2rayA
Get-Service -Name v2rayA | Start-Service
