# Stop the v2rayA service before resetting the password.
Get-Service -Name v2rayA | Stop-Service -Force -Verbose

# The service runs as SYSTEM, so its configuration lives under %ProgramData%\SYSTEM\v2rayA.
$options = @("--reset-password", "--config", "$env:ProgramData\SYSTEM\v2rayA")
Start-Process "$(scoop prefix v2raya-np)\bin\v2raya.exe" -ArgumentList $options -WindowStyle Hidden -Wait -Verb RunAs

# Start the v2rayA service again.
Get-Service -Name v2rayA | Start-Service
