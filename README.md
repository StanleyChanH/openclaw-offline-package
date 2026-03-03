# 🦞 OpenClaw 离线安装包 (Windows)

<p align="center">
  <img src="https://raw.githubusercontent.com/openclaw/openclaw/main/docs/assets/openclaw-logo-text.png" alt="OpenClaw" width="400">
</p>

<p align="center">
  <strong>Windows 一键离线安装 · 无需联网 · 开箱即用</strong>
</p>

---

## 📦 下载安装包

**⚠️ 本仓库仅包含文档，完整离线包请从 [Releases](../../releases) 下载。**

1. 前往 [Releases](../../releases) 页面
2. 下载最新版本的 `openclaw-offline-package.zip`
3. 解压到任意目录
4. 双击 `start.bat` 开始安装

---

## ✨ 这是什么？

这是 [OpenClaw](https://github.com/openclaw/openclaw) 的 **Windows 离线一键安装包**。

OpenClaw 是一个运行在你自己设备上的个人 AI 助手，支持多平台消息接入（WhatsApp、Telegram、Slack、Discord、飞书、Signal 等），可以语音交互、浏览器自动化、执行代码、控制设备等。

**离线包优势：**
- 📦 **开箱即用** - 内置 Node.js 运行时，无需预装环境
- 🚀 **一键安装** - 双击 `start.bat` 即可完成安装配置
- 🔒 **离线可用** - 核心依赖已打包，无需联网下载
- 🎯 **轻量快捷** - 自动配置 PATH，全局 `openclaw` 命令立即可用

---

## 📋 系统要求

| 项目 | 要求 |
|------|------|
| 操作系统 | Windows 10 / 11 (64-bit) |
| 权限 | 普通用户权限即可 |
| 网络 | 首次配置需要联网（OAuth 认证） |

---

## 🚀 快速开始

### 1️⃣ 首次安装

双击运行：

```
start.bat
```

脚本会自动：
1. ✅ 检测内置 Node.js 环境
2. ✅ 配置全局 `openclaw` 命令
3. ✅ 将安装目录添加到 PATH
4. ✅ 运行 OpenClaw 引导程序

### 2️⃣ 启动 Gateway

```cmd
start.bat start
```

Gateway 将在 `http://127.0.0.1:18789` 运行。

### 3️⃣ 使用 OpenClaw

```cmd
# 查看帮助
openclaw --help

# 运行诊断
openclaw doctor

# 配置模型
openclaw onboard
```

---

## 📁 目录结构

```
openclaw-offline-package/
├── start.bat          # 主启动脚本
├── openclaw.bat       # 自动生成的命令包装器
├── package.json       # 依赖声明
├── node_modules/      # OpenClaw 及依赖
├── nodejs/            # 内置 Node.js 运行时
└── README.md          # 说明文档
```

---

## ⚙️ 命令参考

| 命令 | 说明 |
|------|------|
| `start.bat` | 首次安装 / 引导配置 |
| `start.bat start` | 启动 Gateway 服务 |
| `start.bat <任意命令>` | 传递命令给 OpenClaw CLI |
| `openclaw` | 全局命令（安装后可用） |

---

## 🔧 故障排除

### Node.js not found

确保 `nodejs` 文件夹存在且包含 `node.exe`。

### 命令未找到

重新运行 `start.bat` 或手动将安装目录添加到 PATH。

### 运行诊断

```cmd
openclaw doctor
```

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
