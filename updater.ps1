# NOTE: Use this PowerShell script in PowerShell Core BUT NOT Windows PowerShell!

$version = curl --silent "https://api.github.com/repos/v2raya/v2raya/releases/latest" | Select-String -Pattern "tag_name" | ForEach-Object { ([string]$_).Split('v')[1] } |  ForEach-Object { ([string]$_).Split('"')[0] }
$old_version = Get-Content ./bucket/v2raya.json | Select-String '"version"' | ForEach-Object { ([string]$_).Split(':')[1] } | ForEach-Object { ([string]$_).Split(',')[0] } | ForEach-Object { ([string]$_).Split('"')[1] }

if ($version -eq $old_version) {
    Write-Host "You have latest v2rayA!"
}
else {
    Write-Host "Update v2rayA scoop bucket to version $version..."
    $v2rayaJSON = Get-Item -LiteralPath ./bucket/v2raya.json | ForEach-Object  -Process { $_.FullName }
    $hash = Get-FileHash $env:temp/v2raya_$version.exe | Select-Object Hash | ForEach-Object -Process { $_.hash }
    $old_hash = Get-Content ./bucket/v2raya.json | Select-String '"hash"'  | ForEach-Object { ([string]$_).Split(':')[1] } | ForEach-Object { ([string]$_).Split(',')[0] } | ForEach-Object { ([string]$_).Split('"')[1] }
    $url = "https://github.com/v2rayA/v2rayA/releases/download/v$version/v2raya_windows_x64_$version.exe"
    $old_url = Get-Content ./bucket/v2raya.json | Select-String '"url"'  | ForEach-Object { ([string]$_).Split('"')[3] }
    curl -L $url --output "$env:temp/v2raya_$version.exe"
    (Get-Content $v2rayaJSON) -replace $old_version, $version | out-file $v2rayaJSON
    (Get-Content $v2rayaJSON) -replace $old_hash, $hash | out-file $v2rayaJSON
    (Get-Content $v2rayaJSON) -replace $old_url, $url | out-file $v2rayaJSON
    Write-Host "v2rayA has been updated to version $version!"
    git commit -a -m "v2rayA: Update to version $version"
}