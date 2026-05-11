@echo off
setlocal EnableDelayedExpansion

REM =============================================================
REM  Realtek ASIO Driver - Uninstall Script
REM  Run as Administrator
REM =============================================================

title Realtek ASIO Driver Uninstaller

REM Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [ERROR] This script must be run as Administrator.
    echo Right-click uninstall.bat and select "Run as administrator".
    pause
    exit /b 1
)

echo ============================================================
echo  Realtek ASIO Driver Uninstaller
echo ============================================================
echo.
echo This will remove the Realtek ASIO driver from your system.
echo.
set /p CONFIRM=Are you sure you want to continue? [Y/N]: 
if /i "%CONFIRM%" NEQ "Y" (
    echo Uninstall cancelled.
    pause
    exit /b 0
)

echo.
echo [1/3] Searching for Realtek ASIO driver in Driver Store...

REM Find the driver INF in the driver store
set DRIVER_INF=
for /f "tokens=1" %%i in ('pnputil /enum-drivers /class "Media" 2^>nul ^| findstr /i "realtekasio"') do (
    if not defined DRIVER_INF set DRIVER_INF=%%i
)

if not defined DRIVER_INF (
    echo [INFO] Realtek ASIO driver not found via pnputil.
    echo        Trying alternate method via Driver Store path...

    REM Fallback: search by INF name directly
    for /f "delims=" %%p in ('dir /s /b "%SystemRoot%\INF\realtekasio.inf" 2^>nul') do (
        echo [INFO] Found driver INF at: %%p
        pnputil /delete-driver "%%p" /force
        if !errorlevel! EQU 0 (
            echo [SUCCESS] Driver removed successfully.
        ) else (
            echo [WARNING] Could not remove via pnputil. Try DriverStoreExplorer.
        )
        goto :done
    )

    echo [INFO] Realtek ASIO driver does not appear to be installed on this system.
    echo        If it is still present, use DriverStoreExplorer to remove realtekasio.inf manually.
    echo        https://github.com/lostindark/DriverStoreExplorer
    pause
    exit /b 0
)

echo [2/3] Found driver: %DRIVER_INF%
echo.
echo [3/3] Removing driver...
pnputil /delete-driver "%DRIVER_INF%" /force

if %errorlevel% EQU 0 (
    goto :success
) else (
    goto :fallback
)

:success
echo.
echo ============================================================
echo  [SUCCESS] Realtek ASIO driver removed successfully.
echo  You may need to restart your computer to complete removal.
echo ============================================================
pause
exit /b 0

:fallback
echo.
echo [WARNING] Could not remove driver automatically.
echo.
echo Please use one of these manual methods:
echo   1. DriverStoreExplorer: https://github.com/lostindark/DriverStoreExplorer
echo      Search for 'realtekasio.inf' and force-delete it.
echo   2. Control Panel -^> Programs -^> Uninstall a program
echo      Find Realtek ASIO and uninstall.
echo   3. RealtekASIOInstaller by KeppySoftware:
echo      https://github.com/KeppySoftware/RealtekASIOInstaller
echo.
pause
exit /b 1

:done
pause
exit /b 0
