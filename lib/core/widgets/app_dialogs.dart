import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/app_timing.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';
import '../utils/app_snackbar.dart';
import '../../features/dictionary/presentation/widgets/dictionary_dialog.dart' as dict;

class AppDialogs {
  static Future<void> showDictionary(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppConstants.dictionaryDialogTitle,
      transitionDuration:
          Duration(milliseconds: AppTiming.animationDuration),
      pageBuilder: (context, anim1, anim2) => const dict.DictionaryDialog(),
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
      transitionDuration:
          Duration(milliseconds: AppTiming.animationDuration),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Container(
            margin: const EdgeInsets.all(AppDimensions.marginM),
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
              border: Border.all(color: AppColors.borderLight),
            ),
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info, color: AppColors.primary),
                    const SizedBox(width: AppDimensions.spaceS),
                    Text(AppConstants.aboutDialogTitle, style: AppTextStyles.h4),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'Tutup',
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spaceM),
                Text(AppConstants.appName, style: AppTextStyles.h3),
                const SizedBox(height: AppDimensions.spaceS),
                Text(
                  'Versi: ${AppConstants.appVersion}',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: AppDimensions.spaceS),
                Text(AppConstants.appDescription, style: AppTextStyles.bodyMedium),
                const SizedBox(height: AppDimensions.spaceM),
                Text(AppConstants.schoolName, style: AppTextStyles.bodyMedium),
                Text(AppConstants.teacherName, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim, secondary, child) {
        final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
        return FadeTransition(opacity: curved, child: child);
      },
    );
  }
}
