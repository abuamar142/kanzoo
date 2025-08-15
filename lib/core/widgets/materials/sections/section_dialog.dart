import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';
import '../../../../shared/models/material_content.dart';

class DialogLine {
  final String speaker;
  final String text;

  const DialogLine({required this.speaker, required this.text});
}

class SectionDialog extends StatelessWidget {
  final String title;
  final List<DialogLine> dialogLines;
  final List<String>? instructions;
  final MaterialRichText? richInstructions;
  final double fontScale;

  const SectionDialog({
    super.key,
    required this.title,
    required this.dialogLines,
    this.instructions,
    this.richInstructions,
    this.fontScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSectionTitle(title: title),
        const SizedBox(height: AppDimensions.spaceM),

        // Instructions
        if (richInstructions != null) ...[
          _buildRichInstruction(richInstructions!),
          const SizedBox(height: AppDimensions.spaceM),
        ] else if (instructions != null && instructions!.isNotEmpty) ...[
          for (final instruction in instructions!) ...[
            _buildInstruction(instruction),
            const SizedBox(height: AppDimensions.spaceS),
          ],
          const SizedBox(height: AppDimensions.spaceM),
        ],

        // Dialog
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Column(
            children: [
              for (int i = 0; i < dialogLines.length; i++) ...[
                _buildDialogLine(dialogLines[i], i),
                if (i < dialogLines.length - 1)
                  Divider(
                    color: AppColors.borderLight,
                    height: 1,
                    thickness: 1,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstruction(String instruction) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.info.withAlpha((AppColors.alpha05 * 255).round()),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.info.withAlpha((AppColors.alpha20 * 255).round()),
        ),
      ),
      child: Text(
        instruction,
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
        ),
      ),
    );
  }

  Widget _buildRichInstruction(MaterialRichText richText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.info.withAlpha((AppColors.alpha05 * 255).round()),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.info.withAlpha((AppColors.alpha20 * 255).round()),
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
          ),
          children: richText.spans.map((span) {
            return TextSpan(
              text: span.text,
              style: TextStyle(
                color: _getColorFromName(span.color),
                fontWeight: span.isHighlighted ? FontWeight.bold : null,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color? _getColorFromName(String? colorName) {
    if (colorName == null) return null;

    switch (colorName.toLowerCase()) {
      case 'primary':
        return AppColors.primary;
      case 'secondary':
        return AppColors.secondary;
      case 'success':
        return AppColors.success;
      case 'warning':
        return AppColors.warning;
      case 'error':
        return AppColors.error;
      case 'info':
        return AppColors.info;
      case 'arabicgreen':
        return AppColors.arabicGreen;
      case 'primarylight':
        return AppColors.primaryLight;
      case 'primarydark':
        return AppColors.primaryDark;
      default:
        return AppColors.primary; // Default fallback
    }
  }

  Widget _buildDialogLine(DialogLine line, int index) {
    final hasArabic = _hasArabic(line.text);
    final hasLatinOrDigit = _hasLatinOrDigit(line.text);
    final isPureArabic = hasArabic && !hasLatinOrDigit;

    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dialog text
          Expanded(
            child: Text(
              line.text,
              style: isPureArabic
                  ? AppTextStyles.arabicText.copyWith(
                      fontSize:
                          (AppTextStyles.arabicText.fontSize ?? 18) * fontScale,
                    )
                  : AppTextStyles.bodyMedium.copyWith(
                      fontSize:
                          (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
                    ),
              textDirection: isPureArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              textAlign: isPureArabic ? TextAlign.right : TextAlign.left,
            ),
          ),
          const SizedBox(width: AppDimensions.spaceS),
          // Speaker name
          SizedBox(
            child: Text(
              ':${line.speaker}',
              style: AppTextStyles.arabicText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: (AppTextStyles.arabicText.fontSize ?? 18) * fontScale,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  bool _hasArabic(String s) {
    for (final cp in s.runes) {
      if ((cp >= 0x0600 && cp <= 0x06FF) ||
          (cp >= 0x0750 && cp <= 0x077F) ||
          (cp >= 0x08A0 && cp <= 0x08FF) ||
          (cp >= 0xFB50 && cp <= 0xFDFF) ||
          (cp >= 0xFE70 && cp <= 0xFEFF)) {
        return true;
      }
    }
    return false;
  }

  bool _hasLatinOrDigit(String s) {
    return RegExp(r'[A-Za-z0-9]').hasMatch(s);
  }
}
