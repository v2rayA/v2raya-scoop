# v2raya-scoop
Scoop bucket of v2rayA for Windows users, powered by project v2rayA and project [FastGit](https://fastgit.org/).

## How to install

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

## How to use

`v2raya` command has been shimed by Scoop to run v2rayA with `--lite` arg and use `v2ray` core installed by Scoop. `v2raya-win` command is the origin v2rayA.

You can use `⊞ + R` to open Runs windows, and run `v2raya` command in it. If you need to run v2rayA in background, you can open a PowerShell, then run:

```ps1
Start-Process v2raya.exe -WindowStyle hidden
```