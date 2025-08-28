import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class ButtonSection extends MaterialSection {
  final String title;
  final String buttonText;
  final String url;
  final String? description;
  final IconData? icon;

  const ButtonSection({
    required this.title,
    required this.buttonText,
    required this.url,
    this.description,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontSizeController>(
      init: Get.find<FontSizeController>(),
      builder: (fontController) {
        return Obx(() {
          final scaledTitleStyle = AppTextStyles.h4.copyWith(
            fontSize: AppTextStyles.h4.fontSize! * fontController.fontScale,
          );

          final scaledBodyStyle = AppTextStyles.bodyMedium.copyWith(
            fontSize:
                AppTextStyles.bodyMedium.fontSize! * fontController.fontScale,
          );

          final scaledButtonStyle = AppTextStyles.buttonMedium.copyWith(
            fontSize:
                AppTextStyles.buttonMedium.fontSize! * fontController.fontScale,
          );

          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: AppDimensions.spaceM),
            padding: const EdgeInsets.all(AppDimensions.paddingL),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withValues(
                    alpha: AppColors.alpha05,
                  ),
                  blurRadius: AppDimensions.spaceS,
                  offset: const Offset(0, AppDimensions.spaceXS),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: scaledTitleStyle.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Description (if provided)
                if (description != null && description!.isNotEmpty) ...[
                  const SizedBox(height: AppDimensions.spaceM),
                  Text(
                    description!,
                    style: scaledBodyStyle.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],

                const SizedBox(height: AppDimensions.spaceL),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _launchUrl(url),
                    icon: Icon(
                      icon ?? Icons.open_in_browser,
                      size: AppDimensions.iconS,
                      color: AppColors.surface,
                    ),
                    label: Text(
                      buttonText,
                      style: scaledButtonStyle.copyWith(
                        color: AppColors.surface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingL,
                        vertical: AppDimensions.paddingM,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusM,
                        ),
                      ),
                      elevation: AppDimensions.spaceXS,
                    ),
                  ),
                ),

                // URL hint
                const SizedBox(height: AppDimensions.spaceS),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimensions.paddingS),
                  decoration: BoxDecoration(
                    color: AppColors.info.withValues(alpha: AppColors.alpha05),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                    border: Border.all(
                      color: AppColors.info.withValues(
                        alpha: AppColors.alpha20,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: AppDimensions.iconS,
                        color: AppColors.info,
                      ),
                      const SizedBox(width: AppDimensions.spaceS),
                      Expanded(
                        child: Text(
                          AppConstants.externalLinkNotice,
                          style: scaledBodyStyle.copyWith(
                            color: AppColors.info,
                            fontSize: scaledBodyStyle.fontSize! * 0.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> _launchUrl(String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);

      bool canLaunch = await canLaunchUrl(url);

      if (canLaunch) {
        bool launched = await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );

        if (!launched) {
          await launchUrl(url, mode: LaunchMode.platformDefault);
        }
      } else {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      try {
        final Uri url = Uri.parse(urlString);
        await launchUrl(
          url,
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
            enableDomStorage: true,
          ),
        );
      } catch (fallbackError) {
        AppSnackbar.showError(
          title: AppConstants.errorTitle,
          message:
              '${AppConstants.linkOpenError}: Tidak dapat membuka browser. Pastikan ada aplikasi browser yang terinstal.',
        );
      }
    }
  }
}
