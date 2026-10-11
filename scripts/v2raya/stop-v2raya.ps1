taskkill.exe /IM 'v2raya.exe' /FI "status eq running" | Out-Null
taskkill.exe /IM 'v2raya_core.exe' /FI "status eq running" | Out-Null
