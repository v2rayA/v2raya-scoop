# v2raya-scoop
[Scoop](https://scoop.sh) bucket of v2rayA for Windows users.

## How to install

It's suggested to use `scoop` in latest [PowerShell Core](https://aka.ms/PowerShell-Release?tag=stable)

Add bucket

```ps1
scoop bucket add v2raya https://github.com/v2rayA/v2raya-scoop
```

Update buckets

```ps1
scoop update
```

Install v2rayA

```ps1
scoop install v2raya
```

Install V2Ray rules dat (optional)

```ps1
scoop install v2ray-rules-dat
```

## How to use

`v2raya` command has been shimed by Scoop to run v2rayA with `--lite` arg, `v2rayawin` command is the origin v2rayA.

Env `V2RAYA_V2RAY_BIN` will be set to `$scoopdir\apps\v2ray\current\v2ray.exe`.

You can use `⊞ + R` to open a Runs window, and run `v2raya` command in it. If you need to run v2rayA in background, you can open a PowerShell, then run:

```ps1
Start-Process v2raya.exe -WindowStyle hidden
```