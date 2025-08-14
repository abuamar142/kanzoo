import 'package:flutter/material.dart';

import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionOne extends StatelessWidget {
  final String title;
  final List<String> paragraphs;
  final double fontScale;
  const SectionOne({
    super.key,
    required this.title,
    required this.paragraphs,
    this.fontScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSectionTitle(title: title),
        for (final p in paragraphs) ...[
          _paragraph(p),
          const SizedBox(height: AppDimensions.spaceS),
        ],
      ],
    );
  }

  Widget _paragraph(String p) {
    final hasArabic = _hasArabic(p);
    final hasLatinOrDigit = _hasLatinOrDigit(p);
    final isPureArabic = hasArabic && !hasLatinOrDigit;
    return SizedBox(
      width: double.infinity,
      child: Text(
        p,
        style: isPureArabic
            ? AppTextStyles.arabicText.copyWith(
                fontSize: (AppTextStyles.arabicText.fontSize ?? 18) * fontScale,
              )
            : AppTextStyles.bodyMedium.copyWith(
                fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
              ),
        textDirection: isPureArabic ? TextDirection.rtl : TextDirection.ltr,
        textAlign: isPureArabic ? TextAlign.right : TextAlign.left,
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
    // Simple check for ASCII letters or digits commonly used in Indonesian text
    return RegExp(r'[A-Za-z0-9]').hasMatch(s);
  }
}
