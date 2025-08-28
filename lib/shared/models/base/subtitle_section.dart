import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class SubtitleSection extends MaterialSection {
  final String subtitle;
  final bool enablePadding;

  const SubtitleSection(this.subtitle, {this.enablePadding = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fontController = Get.find<FontSizeController>();
      final isArabicSubtitle = subtitle.isPrimarilyArabic;

      return Container(
        margin: EdgeInsets.only(
          bottom: enablePadding ? AppDimensions.paddingM : 0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingS,
          vertical: AppDimensions.paddingXS,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: AppColors.alpha05),
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          border: Border(
            left: isArabicSubtitle
                ? BorderSide.none
                : BorderSide(
                    color: AppColors.primary.withValues(
                      alpha: AppColors.alpha30,
                    ),
                    width: AppDimensions.spaceXS * 0.5,
                  ),
            right: isArabicSubtitle
                ? BorderSide(
                    color: AppColors.primary.withValues(
                      alpha: AppColors.alpha30,
                    ),
                    width: AppDimensions.spaceXS * 0.5,
                  )
                : BorderSide.none,
          ),
        ),
        child: Text(
          subtitle,
          style:
              (isArabicSubtitle
                      ? AppTextStyles.arabicText
                      : AppTextStyles.bodyLarge)
                  .copyWith(
                    fontSize:
                        (isArabicSubtitle
                            ? AppTextStyles.arabicText.fontSize!
                            : AppTextStyles.bodyLarge.fontSize!) *
                        fontController.fontScale,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    letterSpacing: isArabicSubtitle ? 0 : 0.3,
                    height: 1.4,
                  ),
          textAlign: isArabicSubtitle ? TextAlign.right : TextAlign.left,
          textDirection: isArabicSubtitle
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
      );
    });
  }
}
