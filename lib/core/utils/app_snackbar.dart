import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';
import '../constants/app_timing.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class AppSnackbar {
  AppSnackbar._();

  static void _showBaseSnackbar({
    required String title,
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Color? textColor,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor ?? AppColors.secondary,
      margin: EdgeInsets.all(AppDimensions.marginM),
      borderRadius: AppDimensions.radiusM,
      duration: duration ?? AppTiming.snackbarDuration,
      icon: Icon(
        icon,
        color: textColor ?? AppColors.secondary,
        size: AppDimensions.iconM,
      ),
      shouldIconPulse: false,
      animationDuration: Duration(milliseconds: AppTiming.fastAnimation),
    );
  }

  static void showSuccess({
    required String message,
    String? title,
    Duration? duration,
  }) {
    _showBaseSnackbar(
      title: title ?? AppConstants.successTitle,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle,
      duration: duration,
    );
  }

  static void showError({
    required String message,
    String? title,
    Duration? duration,
  }) {
    _showBaseSnackbar(
      title: title ?? AppConstants.errorTitle,
      message: message,
      backgroundColor: AppColors.error,
      icon: Icons.error,
      duration: duration ?? AppTiming.snackbarDurationLong,
    );
  }

  static void showInfo({
    required String message,
    String? title,
    Duration? duration,
  }) {
    _showBaseSnackbar(
      title: title ?? AppConstants.infoTitle,
      message: message,
      backgroundColor: AppColors.info,
      icon: Icons.info,
      duration: duration,
    );
  }

  static void showWarning({
    required String message,
    String? title,
    Duration? duration,
  }) {
    _showBaseSnackbar(
      title: title ?? AppConstants.warningTitle,
      message: message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning,
      duration: duration,
    );
  }

  static void showCustom({
    required String title,
    required String message,
    required Color backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration? duration,
  }) {
    if (icon != null) {
      _showBaseSnackbar(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        textColor: textColor,
        duration: duration,
      );
    } else {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: textColor ?? AppColors.secondary,
        margin: EdgeInsets.all(AppDimensions.marginM),
        borderRadius: AppDimensions.radiusM,
        duration: duration ?? AppTiming.snackbarDuration,
        shouldIconPulse: false,
        animationDuration: Duration(milliseconds: AppTiming.fastAnimation),
      );
    }
  }

  static void showComingSoon(String featureName) {
    showInfo(
      message: '$featureName ${AppConstants.comingSoonMessage}',
      title: AppConstants.infoTitle,
      duration: AppTiming.snackbarDurationShort,
    );
  }
}
