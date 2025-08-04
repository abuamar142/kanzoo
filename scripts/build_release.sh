#!/bin/bash

# Kanzoo Build Script
# Script untuk build APK release dengan ABI splits untuk optimasi size

echo "🚀 Building Kanzoo Release APKs with ABI splits..."

# Enable ABI splits untuk release
echo "📝 Enabling ABI splits..."
sed -i 's/isEnable = false/isEnable = true/' android/app/build.gradle.kts
sed -i 's/isUniversalApk = true/isUniversalApk = false/' android/app/build.gradle.kts

# Build release APK
echo "🔨 Building release APK..."
flutter build apk --release --split-per-abi

# Disable ABI splits untuk development
echo "📝 Restoring development configuration..."
sed -i 's/isEnable = true/isEnable = false/' android/app/build.gradle.kts
sed -i 's/isUniversalApk = false/isUniversalApk = true/' android/app/build.gradle.kts

echo "✅ Build completed! APKs available at:"
echo "   - build/app/outputs/flutter-apk/app-arm64-v8a-release.apk"
echo "   - build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk"
echo "   - build/app/outputs/flutter-apk/app-x86_64-release.apk"

# Show APK sizes
echo ""
echo "📦 APK sizes:"
ls -lh build/app/outputs/flutter-apk/*release*.apk
