@echo off
chcp 65001 >nul
setlocal

set "BASE_DIR=%~dp0"

if not exist "%BASE_DIR%nodejs\node.exe" (
    echo [ERROR] Node.js not found!
    echo Please make sure 'nodejs' folder exists.
    pause
    exit /b 1
)

echo ==========================================
echo   OpenClaw Launcher (Node v24+)
echo ==========================================
echo [OK] Using built-in Node.js...

set "PATH=%BASE_DIR%nodejs;%PATH%"
set "NODE_EXE=%BASE_DIR%nodejs\node.exe"

set "OPENCLAW_JS=%BASE_DIR%node_modules\openclaw\openclaw.mjs"

if not exist "%OPENCLAW_JS%" (
    echo [ERROR] Entry file not found: %OPENCLAW_JS%
    echo.
    echo Please check if openclaw.mjs exists in:
    echo %BASE_DIR%node_modules\openclaw\
    echo.
    dir "%BASE_DIR%node_modules\openclaw\" /b
    pause
    exit /b 1
)

echo [OK] Entry file: openclaw.mjs
echo ==========================================

set "CMD=%~1"
if "%CMD%"=="" set "CMD=onboard"

if /I "%CMD%"=="start" goto :do_start
if /I "%CMD%"=="onboard" goto :do_onboard
goto :do_pass

:do_start
echo Starting OpenClaw Gateway (port: 18789)...
"%NODE_EXE%" "%OPENCLAW_JS%" gateway --port 18789 --verbose
goto :end

:do_onboard
echo.
echo [Setup] Configuring global openclaw command...

set "WRAPPER_BAT=%BASE_DIR%openclaw.bat"
(
echo @echo off
echo setlocal
echo set "BASE_DIR=%BASE_DIR%"
echo set "PATH=%%BASE_DIR%%nodejs;%%PATH%%"
echo "%%BASE_DIR%%nodejs\node.exe" "%%BASE_DIR%%node_modules\openclaw\openclaw.mjs" %%*
echo endlocal
) > "%WRAPPER_BAT%"
echo [OK] Created openclaw.bat wrapper

set "CURRENT_PATH=%BASE_DIR:~0,-1%"
set "USER_PATH="
for /f "tokens=2*" %%a in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USER_PATH=%%b"

echo "%USER_PATH%" | findstr /i /c:"%CURRENT_PATH%" >nul
if errorlevel 1 (
    if defined USER_PATH (
        setx Path "%USER_PATH%;%CURRENT_PATH%" >nul
    ) else (
        setx Path "%CURRENT_PATH%" >nul
    )
    echo [OK] Added OpenClaw directory to user PATH
    echo [Tip] Please reopen command prompt for PATH to take effect
) else (
    echo [OK] OpenClaw directory already in PATH
)

echo.
echo Running OpenClaw onboarding...
"%NODE_EXE%" "%OPENCLAW_JS%" onboard --install-daemon
goto :end

:do_pass
"%NODE_EXE%" "%OPENCLAW_JS%" %*
goto :end

:end
endlocal
