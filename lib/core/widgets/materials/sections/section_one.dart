import 'package:flutter/material.dart';

import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionOne extends StatelessWidget {
  final String title;
  final List<String> paragraphs;
  const SectionOne({super.key, required this.title, required this.paragraphs});

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
    final isArabic = _isArabic(p);
    return SizedBox(
      width: double.infinity,
      child: Text(
        p,
        style: isArabic ? AppTextStyles.arabicText : AppTextStyles.bodyMedium,
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        textAlign: isArabic ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  bool _isArabic(String s) {
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
}
