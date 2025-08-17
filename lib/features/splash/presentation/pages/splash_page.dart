import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/mahfudzot/mahfudzot_card.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(SplashController());

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryDark, AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                children: [
                  // Header section
                  _buildHeader(),

                  const SizedBox(height: AppDimensions.spaceXL),

                  // Mahfudzot section
                  Expanded(child: _buildMahfudzotSection()),

                  const SizedBox(height: AppDimensions.spaceL),
                ],
              ),
            ),
          ),

          // Countdown overlay (top-right)
          _buildCountdownOverlay(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.spaceM),

        // App name
        const Text(
          AppConstants.appName,
          style: AppTextStyles.splashTitle,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppDimensions.spaceXS),

        // App description
        const Text(
          AppConstants.appDescription,
          style: AppTextStyles.splashSubtitle,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppDimensions.spaceS),

        // School name badge
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingS,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: AppColors.alpha20),
            borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: AppColors.alpha30),
            ),
          ),
          child: const Text(
            AppConstants.schoolName,
            style: AppTextStyles.splashSubtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildMahfudzotSection() {
    return GetX<SplashController>(
      builder: (controller) {
        if (controller.words.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.secondary),
                const SizedBox(height: AppDimensions.spaceM),
                Text(
                  'Memuat mahfudzot...',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            // Title
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingM,
                vertical: AppDimensions.paddingS,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: AppColors.alpha10),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: AppColors.secondary.withValues(
                    alpha: AppColors.alpha20,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.auto_stories,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                  const SizedBox(width: AppDimensions.spaceS),
                  Text(
                    AppConstants.mahfudzotTodayTitle,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppDimensions.spaceL),

            // Mahfudzot card
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: MahfudzotCard(
                    arabic: controller.words.first.arabic,
                    indonesian: controller.words.first.indonesian,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCountdownOverlay() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Obx(() {
            final controller = Get.find<SplashController>();
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingM,
                vertical: AppDimensions.paddingS,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: AppColors.alpha20),
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusCircular,
                ),
                border: Border.all(
                  color: AppColors.secondary.withValues(
                    alpha: AppColors.alpha30,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timer, color: AppColors.secondary, size: 16),
                  const SizedBox(width: AppDimensions.spaceXS),
                  Text(
                    '${controller.secondsLeft.value}s',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
