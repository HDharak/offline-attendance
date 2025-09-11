Attendance WebView App - created by assistant

Project location: ~/android-build/attendance-webview-app

To download face-api model binaries automatically on your phone:
 1) cd ~/android-build/attendance-webview-app
 2) ./fetch_models.sh
This will attempt to download 6 model files into app/src/main/assets/www/models/
If some files fail to download, copy them manually into that folder and rebuild.

To build:
 1) cd ~/android-build/attendance-webview-app
 2) echo "sdk.dir=$ANDROID_SDK_ROOT" > local.properties
 3) chmod +x gradlew || true
 4) ./gradlew assembleDebug

APK will be at app/build/outputs/apk/debug/app-debug.apk
Install with: termux-open app/build/outputs/apk/debug/app-debug.apk

