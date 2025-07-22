#!/bin/bash

# Change this to the relative path where your APK is located
APK_PATH="ashesi_news.apk"

# The main activity and package name of your app
PACKAGE_NAME="project.oop.ashesi_news"
MAIN_ACTIVITY=".SignupActivity"

# Function to check if ADB is installed, and install it if not
install_adb() {
    if command -v adb &> /dev/null
    then
        echo "ADB is already installed."
    else
        echo "ADB not found. Installing ADB..."

        # For Debian/Ubuntu-based systems
        if [ -f /etc/debian_version ]; then
            sudo apt update
            sudo apt install -y android-tools-adb
        # For Red Hat/Fedora-based systems
        elif [ -f /etc/redhat-release ]; then
            sudo yum install -y android-tools
        # For macOS using Homebrew
        elif command -v brew &> /dev/null; then
            brew install android-platform-tools
        else
            echo "Unsupported OS or ADB installation method not available."
            exit 1
        fi
    fi
}

# Install ADB if not present
install_adb

# Check if the APK exists
if [ ! -f "$APK_PATH" ]; then
    echo "APK not found at $APK_PATH"
    exit 1
fi
echo "APK found at $APK_PATH"

# Install the APK on the connected device
echo "Installing APK..."
adb install -r "$APK_PATH" || { echo "Failed to install APK!"; exit 1; }

# Launch the app
echo "Launching the app..."
adb shell am start -n "$PACKAGE_NAME/$MAIN_ACTIVITY" || { echo "Failed to launch app!"; exit 1; }

# Monitor logs
echo "Monitoring logs (press Ctrl+C to exit)..."
adb logcat

