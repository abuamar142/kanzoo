import 'package:flutter/material.dart';

import '../../features/mufrodat/presentation/widgets/mufrodat_dialog.dart'
    as mf;
import '../constants/app_constants.dart';
import '../constants/app_timing.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';

class AppDialogs {
  static Future<void> showMufrodat(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppConstants.mufrodatDialogTitle,
      transitionDuration: Duration(milliseconds: AppTiming.animationDuration),
      pageBuilder: (context, anim1, anim2) => const mf.MufrodatDialog(),
      transitionBuilder: (context, anim, secondary, child) {
        final curved = CurvedAnimation(
          parent: anim,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(scale: curved, child: child),
        );
      },
    );
  }

  static Future<void> showAboutApp(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppConstants.aboutDialogTitle,
      transitionDuration: Duration(milliseconds: AppTiming.animationDuration),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(AppDimensions.marginM),
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor.withValues(
                      alpha: AppColors.alpha20,
                    ),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header dengan gradient
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppDimensions.paddingL),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.radiusL),
                        topRight: Radius.circular(AppDimensions.radiusL),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Close button
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withValues(
                                alpha: AppColors.alpha20,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              tooltip: 'Tutup',
                              padding: const EdgeInsets.all(8),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppDimensions.spaceS),

                        // App icon
                        Container(
                          padding: const EdgeInsets.all(AppDimensions.paddingL),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withValues(
                              alpha: AppColors.alpha20,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.school,
                            size: 48,
                            color: AppColors.secondary,
                          ),
                        ),

                        const SizedBox(height: AppDimensions.spaceM),

                        // App name
                        Text(
                          AppConstants.appName,
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: AppDimensions.spaceXS),

                        // Version
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
                          ),
                          child: Text(
                            'Versi ${AppConstants.appVersion}',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Description
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppDimensions.paddingM),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(
                              alpha: AppColors.alpha05,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusM,
                            ),
                            border: Border.all(
                              color: AppColors.primary.withValues(
                                alpha: AppColors.alpha10,
                              ),
                            ),
                          ),
                          child: Text(
                            AppConstants.appDescription,
                            style: AppTextStyles.bodyMedium.copyWith(
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: AppDimensions.spaceL),

                        // School info
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                AppDimensions.paddingS,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.arabicGreen.withValues(
                                  alpha: AppColors.alpha10,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.school,
                                color: AppColors.arabicGreen,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: AppDimensions.spaceM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sekolah',
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    AppConstants.schoolName,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: AppDimensions.spaceM),

                        // Teacher info
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                AppDimensions.paddingS,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.info.withValues(
                                  alpha: AppColors.alpha10,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: AppColors.info,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: AppDimensions.spaceM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Guru Pengampu',
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    AppConstants.teacherName,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim, secondary, child) {
        final curved = CurvedAnimation(
          parent: anim,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
