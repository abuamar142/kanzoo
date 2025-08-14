import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionFive extends StatelessWidget {
  final String title;
  final String? instruction; // optional subtitle/instruction
  final List<String> questions; // question text
  final List<List<String>> subItems; // parallel list of sub items per question
  final double fontScale;

  const SectionFive({
    super.key,
    required this.title,
    required this.questions,
    required this.subItems,
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
        for (int i = 0; i < questions.length; i++) ...[
          _questionCard(i + 1, questions[i], (i < subItems.length) ? subItems[i] : const []),
          const SizedBox(height: AppDimensions.spaceS),
        ],
      ],
    );
  }

  Widget _questionCard(int number, String question, List<String> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$number)', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(width: AppDimensions.spaceS),
              Expanded(
                child: Text(
                  question,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          if (children.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.spaceS),
            Padding(
              padding: const EdgeInsets.only(left: AppDimensions.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < children.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppDimensions.spaceXS),
                      child: _subItemRow(i + 1, children[i]),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _subItemRow(int number, String text) {
    final hasArabic = _hasArabic(text);
    final hasLatinOrDigit = RegExp(r'[A-Za-z0-9]').hasMatch(text);
    final isPureArabic = hasArabic && !hasLatinOrDigit;
    final style = (isPureArabic ? AppTextStyles.arabicText : AppTextStyles.bodyMedium).copyWith(
      fontSize: ((isPureArabic ? AppTextStyles.arabicText.fontSize : AppTextStyles.bodyMedium.fontSize) ?? 14) * fontScale,
    );

    if (isPureArabic) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: style,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: AppDimensions.spaceS),
          Text(
            _toArabicNumber(number),
            style: AppTextStyles.arabicText.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: (AppTextStyles.arabicText.fontSize ?? 18) * (fontScale * 0.9),
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$number.', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(width: AppDimensions.spaceS),
        Expanded(
          child: Text(
            text,
            style: style,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }

  String _toArabicNumber(int n) {
    final western = n.toString();
    const digits = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };
    return western.split('').map((c) => digits[c] ?? c).join('');
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

// No private item class; SectionFive receives primitive lists for flexibility
