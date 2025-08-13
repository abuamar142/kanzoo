import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo dengan animasi gradient
        Container(
          width: AppDimensions.logoLarge,
          height: AppDimensions.logoLarge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primaryDark],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: AppColors.alpha30),
                blurRadius: AppDimensions.shadowBlurRadius,
                offset: const Offset(0, AppDimensions.shadowOffset),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background pattern
              Container(
                width: AppDimensions.logoMedium,
                height: AppDimensions.logoMedium,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary.withValues(
                    alpha: AppColors.alpha20,
                  ),
                ),
              ),
              // Main icon
              const Icon(
                Icons.school,
                size: AppDimensions.iconXXL,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.spaceL),

        // Welcome text
        Text(
          AppConstants.welcomeText,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spaceS),

        // App name with gradient effect
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL,
            vertical: AppDimensions.paddingS,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            color: AppColors.primary.withValues(alpha: AppColors.alpha05),
          ),
          child: Text(
            AppConstants.appName,
            style: AppTextStyles.h1.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceM),

        // App description
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
          ),
          child: Text(
            AppConstants.appDescriptionLogin,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
