import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionFour extends StatelessWidget {
  final String title;
  final String? instruction; // uses subtitle semantics
  final List<List<String>> items; // list of token lists
  final List<int?> underlineIndices; // same length as items; null for none
  final double fontScale;

  const SectionFour({
    super.key,
    required this.title,
    required this.items,
    required this.underlineIndices,
    this.instruction,
    this.fontScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSectionTitle(title: title),
        if ((instruction ?? '').trim().isNotEmpty) ...[
          Text(
            instruction!.trim(),
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: (AppTextStyles.bodySmall.fontSize ?? 12) * fontScale,
            ),
          ),
          const SizedBox(height: AppDimensions.spaceS),
        ],
        for (int i = 0; i < items.length; i++) ...[
          _scrambleItem(i + 1, items[i], underlineIndices.length > i ? underlineIndices[i] : null),
          const SizedBox(height: AppDimensions.spaceS),
        ],
      ],
    );
  }

  Widget _scrambleItem(int number, List<String> tokens, int? underlineIndex) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$number.', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: AppDimensions.spaceS),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int idx = 0; idx < tokens.length; idx++)
                  _tokenChip(tokens[idx], underline: underlineIndex != null && idx == underlineIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tokenChip(String text, {bool underline = false}) {
    final hasArabic = _hasArabic(text);
    final hasLatinOrDigit = RegExp(r'[A-Za-z0-9]').hasMatch(text);
    final isPureArabic = hasArabic && !hasLatinOrDigit;
    final style = (isPureArabic ? AppTextStyles.arabicText : AppTextStyles.bodyMedium).copyWith(
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontSize: ((isPureArabic ? AppTextStyles.arabicText.fontSize : AppTextStyles.bodyMedium.fontSize) ?? 14) * fontScale,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Text(
        text,
        style: style,
        textDirection: isPureArabic ? TextDirection.rtl : TextDirection.ltr,
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
}

