import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';

class FontSizeOverlay extends StatelessWidget {
  const FontSizeOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FontSizeController>();

    return Obx(() {
      if (!controller.isOverlayVisible) {
        return const SizedBox.shrink();
      }

      return Positioned(
        bottom: AppDimensions.spaceL,
        right: AppDimensions.spaceM,
        child: Material(
          elevation: AppDimensions.cardElevation,
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          color: AppColors.surface,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingM,
              vertical: AppDimensions.paddingS,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(
                    alpha: AppColors.alpha20,
                  ),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Decrease button
                _buildSimpleFontButton(
                  icon: Icons.text_decrease,
                  onTap: controller.decreaseFontSize,
                  isEnabled:
                      controller.fontSize > AppConstants.materialFontSizeMin,
                ),

                const SizedBox(width: AppDimensions.spaceS),

                // Font size display
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingS,
                    vertical: 4,
                  ),
                  child: Text(
                    controller.fontSizeLabel,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                const SizedBox(width: AppDimensions.spaceS),

                // Increase button
                _buildSimpleFontButton(
                  icon: Icons.text_increase,
                  onTap: controller.increaseFontSize,
                  isEnabled:
                      controller.fontSize < AppConstants.materialFontSizeMax,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSimpleFontButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isEnabled,
  }) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isEnabled
              ? AppColors.primary.withValues(alpha: AppColors.alpha10)
              : AppColors.textSecondary.withValues(alpha: AppColors.alpha05),
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        child: Icon(
          icon,
          color: isEnabled ? AppColors.primary : AppColors.textHint,
          size: AppDimensions.iconS,
        ),
      ),
    );
  }
}
