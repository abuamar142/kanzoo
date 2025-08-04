import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

/// Utility class for showing consistent snackbars throughout the app
class AppSnackbar {
  /// Private constructor to prevent instantiation
  AppSnackbar._();

  /// Show success snackbar with green background
  static void showSuccess({
    required String message,
    String? title,
    Duration? duration,
  }) {
    Get.snackbar(
      title ?? AppConstants.successTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.secondary,
      margin: const EdgeInsets.all(AppDimensions.marginM),
      borderRadius: AppDimensions.radiusM,
      duration: duration ?? const Duration(seconds: 3),
      icon: const Icon(
        Icons.check_circle,
        color: AppColors.secondary,
        size: AppDimensions.iconM,
      ),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  /// Show error snackbar with red background
  static void showError({
    required String message,
    String? title,
    Duration? duration,
  }) {
    Get.snackbar(
      title ?? AppConstants.errorTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error,
      colorText: AppColors.secondary,
      margin: const EdgeInsets.all(AppDimensions.marginM),
      borderRadius: AppDimensions.radiusM,
      duration: duration ?? const Duration(seconds: 4),
      icon: const Icon(
        Icons.error,
        color: AppColors.secondary,
        size: AppDimensions.iconM,
      ),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  /// Show info snackbar with blue background
  static void showInfo({
    required String message,
    String? title,
    Duration? duration,
  }) {
    Get.snackbar(
      title ?? AppConstants.infoTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.info,
      colorText: AppColors.secondary,
      margin: const EdgeInsets.all(AppDimensions.marginM),
      borderRadius: AppDimensions.radiusM,
      duration: duration ?? const Duration(seconds: 3),
      icon: const Icon(
        Icons.info,
        color: AppColors.secondary,
        size: AppDimensions.iconM,
      ),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  /// Show warning snackbar with orange background
  static void showWarning({
    required String message,
    String? title,
    Duration? duration,
  }) {
    Get.snackbar(
      title ?? AppConstants.warningTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.warning,
      colorText: AppColors.secondary,
      margin: const EdgeInsets.all(AppDimensions.marginM),
      borderRadius: AppDimensions.radiusM,
      duration: duration ?? const Duration(seconds: 3),
      icon: const Icon(
        Icons.warning,
        color: AppColors.secondary,
        size: AppDimensions.iconM,
      ),
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  /// Show custom snackbar with custom colors and icon
  static void showCustom({
    required String title,
    required String message,
    required Color backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor ?? AppColors.secondary,
      margin: const EdgeInsets.all(AppDimensions.marginM),
      borderRadius: AppDimensions.radiusM,
      duration: duration ?? const Duration(seconds: 3),
      icon: icon != null
          ? Icon(
              icon,
              color: textColor ?? AppColors.secondary,
              size: AppDimensions.iconM,
            )
          : null,
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  /// Show coming soon snackbar - commonly used in the app
  static void showComingSoon(String featureName) {
    showInfo(
      message: '$featureName ${AppConstants.comingSoonMessage}',
      title: AppConstants.infoTitle,
      duration: const Duration(seconds: 2),
    );
  }
}
