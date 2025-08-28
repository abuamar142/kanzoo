import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class TitleSection extends MaterialSection {
  final String title;
  final bool enablePadding;

  const TitleSection(this.title, {this.enablePadding = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fontController = Get.find<FontSizeController>();
      final isArabicTitle = title.isPrimarilyArabic;

      return Container(
        margin: EdgeInsets.only(
          bottom: enablePadding ? AppDimensions.paddingL : 0,
        ),
        child: Column(
          crossAxisAlignment: isArabicTitle
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  (isArabicTitle ? AppTextStyles.arabicLarge : AppTextStyles.h2)
                      .copyWith(
                        fontSize:
                            (isArabicTitle
                                ? AppTextStyles.arabicLarge.fontSize!
                                : AppTextStyles.h2.fontSize!) *
                            fontController.fontScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        letterSpacing: isArabicTitle ? 0 : 0.5,
                        height: 1.3,
                      ),
              textAlign: isArabicTitle ? TextAlign.right : TextAlign.left,
              textDirection: isArabicTitle
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
            SizedBox(height: AppDimensions.spaceXS),
            Container(
              height: AppDimensions.spaceXS * 0.5,
              width: AppDimensions.spaceXXL,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withValues(alpha: AppColors.alpha20),
                  ],
                  begin: isArabicTitle
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  end: isArabicTitle
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
              ),
            ),
          ],
        ),
      );
    });
  }
}
