import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'dialog_line.dart';
import 'material_section.dart';

class DialogSection extends MaterialSection {
  final List<DialogLine> dialogLines;

  const DialogSection(this.dialogLines);

  // Generate distinct colors for speakers
  Color _getSpeakerColor(String speaker) {
    final speakerHash = speaker.hashCode;
    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      AppColors.error,
      AppColors.info,
      AppColors.arabicGreen,
    ];
    return colors[speakerHash.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fontController = Get.find<FontSizeController>();

      final scaledDialogStyle = AppTextStyles.bodyMedium.copyWith(
        fontSize:
            AppTextStyles.bodyMedium.fontSize! * (fontController.fontScale),
      );

      final scaledSpeakerStyle = AppTextStyles.bodyLarge.copyWith(
        fontSize:
            AppTextStyles.bodyLarge.fontSize! * (fontController.fontScale),
        fontWeight: FontWeight.bold,
      );

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: dialogLines.map((dialogLine) {
            final isArabicText = dialogLine.text.isPrimarilyArabic;
            final speakerColor = _getSpeakerColor(dialogLine.speaker);

            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spaceM),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dialog text (left side)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(AppDimensions.paddingS),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusS,
                        ),
                        border: Border.all(
                          color: speakerColor.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        dialogLine.text,
                        style: scaledDialogStyle,
                        textAlign: isArabicText
                            ? TextAlign.right
                            : TextAlign.left,
                        textDirection: isArabicText
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
                    ),
                  ),

                  // Separator
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spaceS,
                    ),
                    child: Text(
                      ':',
                      style: scaledSpeakerStyle.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),

                  // Speaker name (right side)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingS,
                      vertical: AppDimensions.paddingXS,
                    ),
                    decoration: BoxDecoration(
                      color: speakerColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                      border: Border.all(
                        color: speakerColor.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      dialogLine.speaker,
                      style: scaledSpeakerStyle.copyWith(color: speakerColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
