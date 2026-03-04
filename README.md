# 🦞 OpenClaw 离线安装包 (Windows)

<p align="center">
  <img src="https://raw.githubusercontent.com/openclaw/openclaw/main/docs/assets/openclaw-logo-text.png" alt="OpenClaw" width="400">
</p>

<p align="center">
  <strong>🚫 完全离线安装 · ⚡ 零依赖下载 · 🔄 自动同步官方版本</strong>
</p>

<p align="center">
  <a href="../../releases">
    <img src="https://img.shields.io/github/v/release/openclaw/openclaw?label=Official&color=blue" alt="Official Version">
  </a>
  <a href="../../releases">
    <img src="https://img.shields.io/github/v/release/openclaw-offline-package/openclaw-offline-package?label=Offline%20Package" alt="Offline Package Version">
  </a>
  <img src="https://img.shields.io/github/actions/workflow/status/openclaw-offline-package/openclaw-offline-package/build-release.yml?label=Auto%20Sync" alt="Build Status">
</p>

---

## 🌟 为什么选择离线包？

### 传统安装方式的问题
```bash
npm install -g openclaw
```
- ❌ 需要预装 Node.js 环境
- ❌ 需要稳定的网络连接
- ❌ 下载慢，可能遇到网络问题
- ❌ 需要等待依赖下载完成

### 离线包优势

| 特性 | 传统方式 | 离线包 |
|------|---------|--------|
| 需要 Node.js | ✅ 需要 | ❌ **不需要** |
| 需要网络下载 | ✅ 需要 | ❌ **不需要** |
| 安装速度 | 取决于网络 | **即解即用** |
| 适合内网环境 | ❌ 不支持 | ✅ **完全支持** |
| 适合新手 | 需要命令行 | **双击即用** |

---

## 🔄 自动版本同步

本仓库通过 GitHub Actions **自动检测并同步** [OpenClaw 官方版本](https://github.com/openclaw/openclaw)：

- ⏰ **每小时检查** - 自动检测 npm 上的最新版本
- 🤖 **自动构建** - 检测到新版本时自动打包
- 📦 **自动发布** - Release 与官方版本号保持一致
- 🔒 **SHA256 校验** - 每个包都提供完整性校验

**你永远可以在这里获取到最新版本的 OpenClaw！**

---

## 📦 下载安装

1. 前往 [**Releases**](../../releases) 页面
2. 下载最新版本的 `openclaw-offline-package-vX.X.X.zip`
3. 解压到任意目录（建议路径不含中文和空格）
4. 按下方步骤操作

### 验证下载完整性（可选）

```powershell
# Windows PowerShell
CertUtil -hashfile openclaw-offline-package-vX.X.X.zip SHA256
# 对比输出的值与 .sha256 文件中的内容
```

---

## 🚀 快速开始

### 步骤 1️⃣：首次配置

双击运行：

```
01_首次配置.bat
```

脚本会自动完成：

- ✅ 检测内置 Node.js 环境
- ✅ 配置全局 `openclaw` 命令
- ✅ 将安装目录添加到用户 PATH
- ✅ 运行 OpenClaw 配置向导（选择 AI 模型等）

> ⚠️ **注意**：首次配置需要联网进行 OAuth 认证。

### 步骤 2️⃣：启动服务

双击运行：

```
02_启动服务.bat
```

Gateway 将在 `http://127.0.0.1:18789` 运行。

### 常用命令

配置完成后，可在任意命令行使用：

```cmd
openclaw --help      # 查看帮助
openclaw doctor      # 运行诊断
openclaw onboard     # 重新配置 AI 模型
```

---

## 📋 系统要求

| 项目 | 要求 |
|------|------|
| 操作系统 | Windows 10 / 11 (64-bit) |
| 权限 | 普通用户权限即可 |
| 网络 | 仅首次 OAuth 认证需要联网 |

---

## 📁 包内容

```
openclaw-offline-package/
├── 01_首次配置.bat    # 👈 首次使用请双击这个
├── 02_启动服务.bat    # 👈 配置完成后双击这个启动
├── start.bat          # 核心脚本（内部调用）
├── openclaw.bat       # openclaw 命令包装器（自动生成）
├── package.json       # 依赖声明
├── node_modules/      # OpenClaw 及所有依赖（已打包）
├── nodejs/            # 内置 Node.js 运行时（已打包）
└── README.md          # 说明文档
```

**📦 包含完整运行环境，解压后约 200MB，无需任何额外下载！**

---

## ⚙️ 文件说明

| 文件 | 说明 |
|------|------|
| `01_首次配置.bat` | 首次安装、配置 AI 模型 |
| `02_启动服务.bat` | 启动 Gateway 服务 |
| `start.bat` | 核心脚本，支持更多命令 |
| `openclaw` | 全局命令（配置后可在任意位置使用） |

### 高级用法

```cmd
start.bat <命令>       # 执行任意 openclaw 命令
start.bat doctor       # 运行诊断
start.bat --help       # 查看帮助
```

---

## 🔧 故障排除

<details>
<summary><b>Node.js not found</b></summary>

确保 `nodejs` 文件夹存在且包含 `node.exe`。如果文件损坏，请重新下载离线包。
</details>

<details>
<summary><b>'openclaw' 不是内部或外部命令</b></summary>

1. 重新运行 `01_首次配置.bat`
2. 重新打开命令行窗口（PATH 需要刷新）
3. 或手动添加 PATH：右键「此电脑」→ 属性 → 高级系统设置 → 环境变量
</details>

<details>
<summary><b>服务启动失败</b></summary>

运行诊断检查环境配置：

```cmd
start.bat doctor
```

常见问题：
- 端口 18789 被占用 → 关闭占用进程或修改端口
- 配置文件损坏 → 删除 `%USERPROFILE%\.openclaw` 重新配置
</details>

---

## 🔄 更新到新版本

1. 下载最新版本的离线包
2. 解压到新目录（或覆盖旧目录）
3. 重新运行 `01_首次配置.bat`

> 💡 **提示**：配置文件存储在用户目录 `~/.openclaw/`，更新不会丢失配置。

---

## 📚 更多资源

- [OpenClaw 官方文档](https://docs.openclaw.ai)
- [入门指南](https://docs.openclaw.ai/start/getting-started)
- [GitHub 仓库](https://github.com/openclaw/openclaw)
- [Discord 社区](https://discord.gg/clawd)

---

## 📄 许可证

OpenClaw 采用 [MIT 许可证](https://github.com/openclaw/openclaw/blob/main/LICENSE)。

---

<p align="center">
  <strong>EXFOLIATE! EXFOLIATE!</strong>
</p>
