import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Container(
              width: AppDimensions.splashLogoSize,
              height: AppDimensions.splashLogoSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingM),
                child: SvgPicture.asset(
                  AppConstants.logoPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: AppDimensions.spaceXL),

            // App Name
            const Text(AppConstants.appName, style: AppTextStyles.splashTitle),

            const SizedBox(height: AppDimensions.spaceS),

            // App Description
            const Text(
              AppConstants.appDescription,
              style: AppTextStyles.splashSubtitle,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.spaceXL),

            // School Name
            Text(
              AppConstants.schoolName,
              style: AppTextStyles.splashSubtitle.copyWith(
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.spaceXXL),

            // Loading Indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
