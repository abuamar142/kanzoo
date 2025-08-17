import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

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
            child: Column(
              children: [
                // Header section (1/3 of screen)
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingM,
                      vertical: AppDimensions.paddingS,
                    ),
                    child: Center(child: _buildHeader()),
                  ),
                ),

                // Divider section
                _buildDivider(),

                // Mahfudzot section (2/3 of screen)
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingM),
                    child: _buildMahfudzotSection(),
                  ),
                ),
              ],
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // App logo or icon placeholder
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: AppColors.alpha20),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: AppColors.alpha30),
              width: 2,
            ),
          ),
          child: Icon(
            Icons.school_outlined,
            size: 40,
            color: AppColors.secondary,
          ),
        ),

        const SizedBox(height: AppDimensions.spaceM),

        // App name with enhanced styling
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingXS,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: AppColors.alpha10),
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: AppColors.alpha20),
            ),
          ),
          child: const Text(
            AppConstants.appName,
            style: AppTextStyles.splashTitle,
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: AppDimensions.spaceS),

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
            vertical: AppDimensions.paddingXS,
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

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.secondary.withValues(alpha: AppColors.alpha30),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingS,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingS,
                vertical: AppDimensions.paddingXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: AppColors.alpha10),
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusCircular,
                ),
                border: Border.all(
                  color: AppColors.secondary.withValues(
                    alpha: AppColors.alpha20,
                  ),
                ),
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.secondary,
                size: 16,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.secondary.withValues(alpha: AppColors.alpha30),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(
                      alpha: AppColors.alpha10,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                    strokeWidth: 2,
                  ),
                ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Enhanced title with icon and styling
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
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor.withValues(
                      alpha: AppColors.alpha10,
                    ),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.paddingXS),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(
                        alpha: AppColors.alpha20,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.auto_stories,
                      color: AppColors.secondary,
                      size: 18,
                    ),
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

            // Mahfudzot card with enhanced presentation
            Flexible(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
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
          padding: const EdgeInsets.all(AppDimensions.paddingS),
          child: Obx(() {
            final controller = Get.find<SplashController>();
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingS,
                vertical: AppDimensions.paddingXS,
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
                  Icon(Icons.timer, color: AppColors.secondary, size: 14),
                  const SizedBox(width: AppDimensions.spaceXS),
                  Text(
                    '${controller.secondsLeft.value}s',
                    style: AppTextStyles.caption.copyWith(
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
