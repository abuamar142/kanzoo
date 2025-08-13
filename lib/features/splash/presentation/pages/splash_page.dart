import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/mufrodat/base_mufrodat_item.dart';
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
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.spaceL),

                // Header: App title + description
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingM,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: AppDimensions.spaceS),
                      const Text(
                        AppConstants.appName,
                        style: AppTextStyles.splashTitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spaceXS),
                      const Text(
                        AppConstants.appDescription,
                        style: AppTextStyles.splashSubtitle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spaceS),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingM,
                          vertical: AppDimensions.paddingXS,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withValues(
                            alpha: AppColors.alpha20,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusCircular,
                          ),
                          border: Border.all(
                            color: AppColors.secondary.withValues(
                              alpha: AppColors.alpha20,
                            ),
                          ),
                        ),
                        child: Text(
                          AppConstants.schoolName,
                          style: AppTextStyles.splashSubtitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppDimensions.spaceL),

                // Mufrodat Panel
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingM,
                    ),
                    child: GetX<SplashController>(
                      builder: (c) {
                        if (c.words.isEmpty) return const SizedBox.shrink();
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppDimensions.paddingM),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withValues(
                              alpha: AppColors.alpha10,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusL,
                            ),
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
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                AppConstants.mufrodatTodayTitle,
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimensions.spaceM),
                              Expanded(
                                child: ListView.separated(
                                  primary: false,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: c.words.length,
                                  separatorBuilder: (_, __) => const SizedBox(
                                    height: AppDimensions.spaceS,
                                  ),
                                  itemBuilder: (context, index) {
                                    final w = c.words[index];
                                    return BaseMufrodatItem(
                                      indonesian: w.indonesian,
                                      arabic: w.arabic,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.spaceL),
              ],
            ),
          ),

          // Countdown overlay (top-right)
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingS),
                child: Obx(() {
                  final c = Get.find<SplashController>();
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingM,
                      vertical: AppDimensions.paddingXS,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(
                        alpha: AppColors.alpha20,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusCircular,
                      ),
                      border: Border.all(
                        color: AppColors.secondary.withValues(
                          alpha: AppColors.alpha30,
                        ),
                      ),
                    ),
                    child: Text(
                      '${c.secondsLeft.value}s',
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
