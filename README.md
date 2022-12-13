# v2raya-scoop

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

```ps1
> scoop bucket add v2raya https://github.com/v2rayA/v2raya-scoop # Add bucket
> scoop update # Update bucket
```

### Install v2rayA

#### Using the installer (recommended)

```ps1
> scoop install v2raya-np # stable version (recommended)
> #scoop install v2raya-unstable-np # unstable version
```

#### Using the binary

```ps1
> scoop install v2raya
> scoop install v2ray-rules-dat # install V2Ray rules dat(optional)
```

## How to use

### Using the installer (recommended)

After installing v2rayA through the installer, v2rayA will run as a service. By default, it will start automatically. You can also manage the start and stop of v2rayA in the "Services" tab in the task manager. You can open the admin page by running the desktop shortcut or by visiting <http://127.0.0.1:2017> directly.

### Using the binary

> - `v2raya` command has been shimed by Scoop to run v2rayA with `--lite` arg, `v2rayawin` command is the origin v2rayA.
> - Env `V2RAYA_V2RAY_BIN` will be set to `$(scoop prefix v2ray)\\v2ray.exe`.

#### Start v2rayA

You can use `Win + R` to open a Runs window, and run `v2raya` command in it.

- Run `v2raya` or `v2rayaWin --lite` to start v2rayA.
- Run `start-v2raya` to start v2rayA in the background.
- Run `stop-v2raya` to stop v2rayA.

#### Add v2raya to startup

```ps1
reg import "$(scoop prefix v2raya)\add-startup.reg"

# remove
reg import "$(scoop prefix v2raya)\remove-startup.reg"
```
