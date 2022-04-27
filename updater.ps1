# NOTE: Use this PowerShell script in PowerShell Core BUT NOT Windows PowerShell!

# mkdir -Path $env:HOME/v2raya-temp
# git clone https://github.com/v2rayA/v2raya-scoop $env:HOME/v2raya-temp/
# Set-Location -Path $env:HOME/v2raya-temp/v2raya-scoop

git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"


# Update v2rayA
$url_v2raya_releases = https://api.github.com/repos/v2rayA/v2rayA/releases/latest
$v2rayaJSON = Get-Item -LiteralPath ./bucket/v2raya.json | ForEach-Object  -Process { $_.FullName }
$version = Invoke-WebRequest -Uri $url_v2raya_releases | ConvertFrom-Json | Select-Object tag_name | ForEach-Object { ([string]$_.tag_name).Split('v')[1] }
$old_version = Get-Content .\bucket\v2raya.json | ConvertFrom-Json | Select-Object version | ForEach-Object { ($_.version)}

if ($version -eq $old_version) {
    Write-Host "You have latest v2rayA!"    
}
else {
    Write-Host "Update v2rayA scoop bucket to version $version..."
    $old_hash = Get-Content $v2rayaJSON | Select-String '"hash"'  | ForEach-Object { ([string]$_).Split(':')[1] } | ForEach-Object { ([string]$_).Split(',')[0] } | ForEach-Object { ([string]$_).Split('"')[1] }
    $url_new_v2raya = "https://github.com/v2rayA/v2rayA/releases/download/v$version/v2raya_windows_x64_$version.exe"
    $old_url_v2raya = Get-Content $v2rayaJSON | Select-String '"url"' | ForEach-Object { ([string]$_).Split('"')[3] }
    Invoke-WebRequest -Uri $url_new_v2raya -OutFile "$env:HOME/v2raya-temp/v2raya_$version.exe"
    $hash = Get-FileHash "$env:HOME/v2raya-temp/v2raya_$version.exe" | Select-Object Hash | ForEach-Object -Process { $_.hash }
    (Get-Content $v2rayaJSON) -replace $old_hash, $hash | out-file $v2rayaJSON
    (Get-Content $v2rayaJSON) -replace $old_url_v2raya, $url_new_v2raya | out-file $v2rayaJSON
    (Get-Content $v2rayaJSON) -replace $old_version, $version | out-file $v2rayaJSON
    Write-Host "v2rayA has been updated to version $version!"
    git commit $v2rayaJSON -m "v2rayA: Update to version $version"
}


# Update extra v2ray rules data
$url_data = https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest
$DataJson = Get-Item -LiteralPath "./bucket/v2ray-rules-dat.json" | ForEach-Object  -Process { $_.FullName }
$DataNewVersion = Invoke-WebRequest -Uri $url_data | ConvertFrom-Json | Select-Object "tag_name" | ForEach-Object { ([string]$_.tag_name) }
$DataOldVersion = Get-Content $DataJson | Select-String '"version"' | ForEach-Object { ([string]$_).Split(':')[1] } | ForEach-Object { ([string]$_).Split(',')[0] } | ForEach-Object { ([string]$_).Split('"')[1] }

if ($DataNewVersion -eq $DataOldVersion) {
    Write-Host "You have latest data files from Loyalsoldier/v2ray-rules-dat, enjoy!"
}
else {
    (Get-Content $DataJson) -replace $DataOldVersion, $DataNewVersion | out-file $DataJson
    $OldGeoIPHash = curl -Ls "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$DataOldVersion/geoip.dat.sha256sum" | ForEach-Object { ([string]$_).Split(' ')[0] }
    $NewGeoIPHash = curl -Ls "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$DataNewVersion/geoip.dat.sha256sum" | ForEach-Object { ([string]$_).Split(' ')[0] }
    (Get-Content $DataJson) -replace $OldGeoIPHash, $NewGeoIPHash | out-file $DataJson
    $OldGeoSiteHash = curl -Ls "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$DataOldVersion/geosite.dat.sha256sum" | ForEach-Object { ([string]$_).Split(' ')[0] }
    $NewGeoSiteHash = curl -Ls "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$DataNewVersion/geosite.dat.sha256sum" | ForEach-Object { ([string]$_).Split(' ')[0] }
    (Get-Content $DataJson) -replace $OldGeoSiteHash, $NewGeoSiteHash | out-file $DataJson
    git commit $DataJson -m "v2ray-rules-dat: Update to version $DataNewVersion"
}


# Update v2rayA git version
$LatestSHA = Invoke-WebRequest -Uri https://api.github.com/repos/v2raya/v2raya/commits/master | ConvertFrom-Json | Select-Object "sha" | ForEach-Object { ($_.sha) }
$JSONSHA = Get-Content ./bucket/v2raya-git.json | Select-String commit_sha |  ForEach-Object { ([string]$_).Split('"')[3] }
$RunnerPath = Get-Item -LiteralPath ./ |ForEach-Object -Process { $_.FullName }
$version_localjson = Get-Content ".\bucket\v2raya-git.json" | Select-String version | Select-Object -First 1| ForEach-Object { ([string]$_).Split('"')[3] }
if ($LatestSHA -eq $JSONSHA) {
    Write-Host "These is no update!"
}else {
    git clone https://github.com/v2raya/v2raya/ $HOME/v2rayA
    Set-Location -Path $HOME/v2rayA
    $DateLong_git = git log -1 --format="%cd" --date=short
    $Date_git = $DateLong_git -replace "-"; ""
    $count_git = git rev-list --count HEAD
    $commit_git = git rev-parse --short HEAD
    $version_git = "$Date_git.r$count_git.$commit_git"
    Set-Location -Path $RunnerPath
    (Get-Content "./bucket/v2raya-git.json") -replace $JSONSHA, $LatestSHA | out-file "./bucket/v2raya-git.json"
    (Get-Content "./bucket/v2raya-git.json") -replace $version_localjson, $version_git | out-file "./bucket/v2raya-git.json"
    Remove-Item -Path $HOME/v2rayA -Recurse -Force
    git commit "./bucket/v2raya-git.json" -m "v2raya-git: Update to version $version_git"
}
