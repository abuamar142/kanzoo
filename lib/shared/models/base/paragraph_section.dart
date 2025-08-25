import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class ParagraphSection extends MaterialSection {
  final List<String> paragraphs;

  const ParagraphSection(this.paragraphs);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fontController = Get.find<FontSizeController>();

      final scaledTextStyle = AppTextStyles.bodyMedium.copyWith(
        fontSize:
            AppTextStyles.bodyMedium.fontSize! * (fontController.fontScale),
      );

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: paragraphs.map((paragraph) {
            final isArabicText = paragraph.isPrimarilyArabic;

            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spaceS),
              child: Text(
                paragraph,
                style: scaledTextStyle,
                textAlign: isArabicText ? TextAlign.right : TextAlign.left,
                textDirection: isArabicText
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
