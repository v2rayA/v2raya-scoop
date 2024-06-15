# v2raya-scoop [![Excavator](https://github.com/v2rayA/v2raya-scoop/actions/workflows/excavator.yml/badge.svg)](https://github.com/v2rayA/v2raya-scoop/actions/workflows/excavator.yml)

[**English**](https://github.com/v2rayA/v2raya-scoop/blob/main/README.md) | 简体中文

[Scoop](https://scoop.sh) 的 v2rayA 桶，适用于 Windows 用户。

## 如何安装

<details>
  <summary>安装 Scoop</summary>

1. 安装 [Git for Windows](https://github.com/git-for-windows/git/releases/latest)。中国用户可以从 [这里](https://mirrors.tuna.tsinghua.edu.cn/github-release/git-for-windows/git/LatestRelease/) 下载。
2. 安装 [PowerShell Core](https://aka.ms/PowerShell-Release?tag=stable)。中国用户可以从 [这里](https://mirrors.tuna.tsinghua.edu.cn/github-release/PowerShell/PowerShell/LatestRelease/) 下载。
3. （可选）安装 [Windows Terminal](https://github.com/microsoft/terminal/releases/latest)。
4. 安装 [Scoop](https://scoop.sh)。

    ```powershell
    > Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # 可选：首次运行远程脚本时需要
    > irm get.scoop.sh | iex
    ```

</details>

### 添加 Bucket

```powershell
> scoop bucket add v2raya https://github.com/v2rayA/v2raya-scoop # 添加桶
> scoop update # 更新桶
```

### 安装 v2rayA

#### 使用安装程序（推荐）

```powershell
> scoop install v2raya-np # 稳定版本（推荐）
> # scoop install v2raya-unstable-np # 不稳定版本
```

#### 使用二进制文件

```powershell
> scoop install v2raya
> scoop install v2ray-rules-dat # 可选
```

## 如何使用

### 使用安装程序（推荐）

通过安装程序安装 v2rayA 后，v2rayA 将作为服务运行。默认情况下，它会自动启动。你也可以在任务管理器的“服务”标签中管理 v2rayA 的启动和停止。你可以通过运行桌面快捷方式或直接访问 <http://127.0.0.1:2017> 来打开管理页面。

#### 重置密码

你可以使用 `Win + R` 打开运行窗口，并运行 `reset-passwd-v2raya-np` 命令。

### 使用二进制文件

> - `v2raya` 命令已被 Scoop 绑定，以 `--lite` 参数运行 v2rayA，`v2rayawin` 命令是原始的 v2rayA。
> - 环境变量 `V2RAYA_V2RAY_BIN` 将被设置为 `$(scoop prefix v2ray)\\v2ray.exe`。

#### 启动/停止 v2rayA

你可以使用 `Win + R` 打开运行窗口，并运行 `v2raya` 命令。

- 运行 `v2raya` 或 `v2rayaWin --lite` 以启动 v2rayA。
- 运行 `start-v2raya` 以在后台启动 v2rayA。
- 运行 `stop-v2raya` 以停止 v2rayA。

#### 重置密码

- 运行 `reset-passwd-v2raya` 以重置 v2rayA 的密码。

#### 添加 v2raya 到启动项

```powershell
> reg import "$(scoop prefix v2raya)\add-startup.reg"

# 移除
> reg import "$(scoop prefix v2raya)\remove-startup.reg"
```
