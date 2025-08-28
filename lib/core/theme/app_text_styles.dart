import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Base font size for scaling
  static const double _baseSize = 16.0;

  // Font families
  static const String _primaryFont = 'Signika';
  static const String _arabicFont = 'Noto Naskh Arabic';

  // Heading Styles
  static const TextStyle h1 = TextStyle(
    fontSize: _baseSize * 1.75, // 28px
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: _primaryFont,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: _baseSize * 1.5, // 24px
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: _primaryFont,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: _baseSize * 1.25, // 20px
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: _primaryFont,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: _baseSize, // 16px
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: _primaryFont,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: _baseSize * 0.875, // 14px
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: _primaryFont,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: _baseSize * 0.75, // 12px
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: _primaryFont,
  );

  // Heading Styles
  static const TextStyle h4 = h3;

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: _baseSize,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
    fontFamily: _primaryFont,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: _baseSize * 0.875,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
    fontFamily: _primaryFont,
  );

  // Arabic Styles - proportional to base
  static const TextStyle arabicText = TextStyle(
    fontSize: _baseSize,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: _arabicFont,
  );

  static const TextStyle arabicLarge = TextStyle(
    fontSize: _baseSize * 1.25,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: _arabicFont,
  );

  // Caption and Label
  static const TextStyle caption = TextStyle(
    fontSize: _baseSize * 0.6875,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
    fontFamily: _primaryFont,
  );

  static const TextStyle label = TextStyle(
    fontSize: _baseSize * 0.875,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: _primaryFont,
  );

  // Splash Screen Styles
  static const TextStyle splashTitle = TextStyle(
    fontSize: _baseSize * 1.5,
    fontWeight: FontWeight.bold,
    color: AppColors.splashText,
    fontFamily: _primaryFont,
  );

  static const TextStyle splashSubtitle = TextStyle(
    fontSize: _baseSize * 0.875,
    fontWeight: FontWeight.normal,
    color: AppColors.splashText,
    fontFamily: _primaryFont,
  );
}
