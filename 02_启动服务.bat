@echo off
chcp 65001 >nul
title OpenClaw - 运行服务
echo ==========================================
echo   OpenClaw 服务启动中...
echo ==========================================
echo 正在加载内置环境...
call start.bat start
pause