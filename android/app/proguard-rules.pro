# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

# Keep Flutter framework classes
-keep class io.flutter.** { *; }
-keep class io.flutter.embedding.** { *; }

# Keep GetX classes
-keep class com.getx.** { *; }
-keep class get.** { *; }

# Keep Google Play Core classes (to fix R8 errors)
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# Remove logs in release
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Keep essential classes
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# Obfuscation
-allowaccessmodification
-mergeinterfacesaggressively
-repackageclasses ''
