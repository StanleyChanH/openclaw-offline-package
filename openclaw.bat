@echo off
setlocal
set "BASE_DIR=D:\git项目\openclaw-offline-package\"
set "PATH=%BASE_DIR%nodejs;%PATH%"
"%BASE_DIR%nodejs\node.exe" "%BASE_DIR%node_modules\openclaw\openclaw.mjs" %*
endlocal
