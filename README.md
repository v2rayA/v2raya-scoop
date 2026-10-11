# v2raya-scoop [![Excavator](https://github.com/v2rayA/v2raya-scoop/actions/workflows/excavator.yml/badge.svg)](https://github.com/v2rayA/v2raya-scoop/actions/workflows/excavator.yml)

English | [**简体中文**](https://github.com/v2rayA/v2raya-scoop/blob/main/README_zh.md)

[Scoop](https://scoop.sh) bucket of v2rayA for Windows users.

## How to install

<details>
  <summary>Install Scoop</summary>

1. Install [Git for Windows](https://github.com/git-for-windows/git/releases/latest). CN users can download from [here](https://mirrors.tuna.tsinghua.edu.cn/github-release/git-for-windows/git/LatestRelease/).
2. Install [PowerShell Core](https://aka.ms/PowerShell-Release?tag=stable). CN users can download from [here](https://mirrors.tuna.tsinghua.edu.cn/github-release/PowerShell/PowerShell/LatestRelease/).
3. (OPTIONAL) Install [Windows Terminal](https://github.com/microsoft/terminal/releases/latest).
4. Install [Scoop](https://scoop.sh).

    ```powershell
    > Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    > irm get.scoop.sh | iex
    ```

</details>

### Add Bucket

```powershell
> scoop bucket add v2raya https://github.com/v2rayA/v2raya-scoop # Add bucket
> scoop update # Update bucket
```

### Install v2rayA

#### Using the installer (recommended)

```powershell
> scoop install v2raya-np # stable version (recommended)
```

#### Using the binary

```powershell
> scoop install v2raya            # bundles v2raya and the matching v2raya_core
> scoop install v2ray-rules-dat   # install geoip.dat/geosite.dat (optional)
```

## How to use

### Using the installer (recommended)

After installing v2rayA through the installer, v2rayA will run as a service. By default, it will start automatically. You can also manage the start and stop of v2rayA in the "Services" tab in the task manager. You can open the admin page by running the desktop shortcut or by visiting <http://127.0.0.1:2017> directly.

#### Reset Passwd

You can use `Win + R` to open a Runs window, and run `reset-passwd-v2raya-np` command in it.

### Using the binary

> -   `v2raya` command has been shimed by Scoop to run v2rayA with the `--lite` arg, `v2rayawin` command is the origin v2rayA.
> -   The release's `v2raya_core` is installed next to `v2raya`, so v2rayA finds its own core automatically.
> -   `wintun.dll` (installed via the `wintun-dll` package) is copied next to the core for the TUN mode; run `v2rayaWin` as administrator to use it.

#### Start/Stop v2rayA

You can use `Win + R` to open a Runs window, and run `v2raya` command in it.

-   Run `v2raya` or `v2rayaWin --lite` to start v2rayA.
-   Run `start-v2raya` to start v2rayA in the background.
-   Run `stop-v2raya` to stop v2rayA.

#### Reset Passwd

-   Run `reset-passwd-v2raya` to reset the password of v2rayA.

#### Add v2raya to startup

```powershell
> reg import "$(scoop prefix v2raya)\add-startup.reg"

# remove
> reg import "$(scoop prefix v2raya)\remove-startup.reg"
```

#### Rule data

v2rayA downloads `geoip.dat` and `geosite.dat` on the first start when they are missing. To install them ahead of time and keep them updated with `scoop update`, install the optional package:

```powershell
> scoop install v2ray-rules-dat
```
