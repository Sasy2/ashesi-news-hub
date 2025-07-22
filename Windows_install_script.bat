@echo off
REM Refined Batch Script to Install and Launch an APK on Android Devices
setlocal EnableDelayedExpansion

REM Define variables
set ADB_URL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip
set DOWNLOAD_DIR=%TEMP%\adb-tools
set APK_PATH=ashesi_news.apk
set PACKAGE_NAME=project.oop.ashesi_news
set MAIN_ACTIVITY=.SignupActivity

REM Welcome message
echo ========================================================
echo          Android APK Installer and Launcher
echo ========================================================
echo.

REM Check if the APK file exists in the current directory
if not exist "%APK_PATH%" (
    echo ERROR: APK file "%APK_PATH%" not found in the current directory.
    echo Please place the APK file in the same directory as this script or update the APK_PATH variable.
    pause
    exit /b 1
)

REM Create the download directory if it doesn't exist
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

REM Check if ADB tools are already downloaded
if not exist "%DOWNLOAD_DIR%\platform-tools" (
    echo ADB tools not found. Downloading from Google...
    powershell -Command "Invoke-WebRequest -Uri %ADB_URL% -OutFile %DOWNLOAD_DIR%\platform-tools.zip"
    if errorlevel 1 (
        echo ERROR: Failed to download ADB tools. Please check your internet connection.
        pause
        exit /b 1
    )
    echo Extracting ADB tools...
    powershell -Command "Expand-Archive -Path %DOWNLOAD_DIR%\platform-tools.zip -DestinationPath %DOWNLOAD_DIR%"
    if errorlevel 1 (
        echo ERROR: Failed to extract ADB tools. Please check disk space or permissions.
        pause
        exit /b 1
    )
    echo ADB tools downloaded and extracted successfully.
)

REM Add ADB tools to PATH for this session
set PATH=%DOWNLOAD_DIR%\platform-tools;%PATH%

REM Verify ADB installation
adb version >nul 2>&1
if errorlevel 1 (
    echo ERROR: ADB is not functioning correctly. Ensure the platform-tools are installed.
    pause
    exit /b 1
)

REM Check if a device is connected
echo Checking for connected Android devices...
adb devices | findstr "device" >nul 2>&1
if errorlevel 1 (
    echo ERROR: No Android device found. Ensure USB debugging is enabled and the device is connected.
    pause
    exit /b 1
)
echo Device detected.

REM Install the APK
echo Installing APK "%APK_PATH%" on the connected device...
adb install -r "%APK_PATH%"
if errorlevel 1 (
    echo ERROR: Failed to install the APK. Ensure the APK file is valid and the device has sufficient storage.
    pause
    exit /b 1
)
echo APK installed successfully.

REM Launch the app
echo Launching the app "%PACKAGE_NAME%"...
adb shell am start -n %PACKAGE_NAME%/%MAIN_ACTIVITY%
if errorlevel 1 (
    echo ERROR: Failed to launch the app. Ensure the package name and activity are correct.
    pause
    exit /b 1
)
echo App launched successfully.

REM Cleanup and exit
echo.
echo ========================================================
echo          Installation and Launch Completed
echo ========================================================
pause
exit /b 0

