import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';

class ScrambleItem extends StatelessWidget {
  final String text;
  final bool isUnderlined;
  final bool isDragging;
  final VoidCallback? onTap;

  const ScrambleItem({
    super.key,
    required this.text,
    this.isUnderlined = false,
    this.isDragging = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fontController = Get.find<FontSizeController>();

    return Obx(() {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingS,
          ),
          decoration: BoxDecoration(
            color: isDragging
                ? AppColors.primary.withValues(alpha: AppColors.alpha30)
                : AppColors.primary.withValues(alpha: AppColors.alpha10),
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            border: Border.all(
              color: isDragging
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: AppColors.alpha20),
              width: isDragging ? 2 : 1,
            ),
            boxShadow: isDragging
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(
                        alpha: AppColors.alpha20,
                      ),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Text(
            text,
            style: text.isArabic
                ? AppTextStyles.arabicText.copyWith(
                    fontSize:
                        AppTextStyles.arabicText.fontSize! *
                        fontController.fontScale,
                    color: AppColors.primary,
                    decoration: isUnderlined
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: AppColors.primary,
                    decorationThickness: 2,
                  )
                : AppTextStyles.bodyMedium.copyWith(
                    fontSize:
                        AppTextStyles.bodyMedium.fontSize! *
                        fontController.fontScale,
                    color: AppColors.primary,
                    decoration: isUnderlined
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: AppColors.primary,
                    decorationThickness: 2,
                  ),
            textDirection: text.isArabic
                ? TextDirection.rtl
                : TextDirection.ltr,
          ),
        ),
      );
    });
  }
}
