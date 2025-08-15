import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../base_section_title.dart';

class SectionExerciseTable extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<String> instructions;
  final List<ExerciseTableItem> exercises;
  final double fontScale;

  const SectionExerciseTable({
    super.key,
    required this.title,
    this.subtitle,
    this.instructions = const [],
    this.exercises = const [],
    this.fontScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSectionTitle(title: title),
        if (subtitle != null) ...[
          const SizedBox(height: AppDimensions.spaceS),
          Text(
            subtitle!,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
              color: AppColors.textSecondary,
            ),
          ),
        ],
        const SizedBox(height: AppDimensions.spaceM),

        // Instructions
        if (instructions.isNotEmpty) ...[
          for (final instruction in instructions) ...[
            _buildInstruction(instruction),
            const SizedBox(height: AppDimensions.spaceS),
          ],
          const SizedBox(height: AppDimensions.spaceM),
        ],

        // Exercise items
        for (int i = 0; i < exercises.length; i++) ...[
          _buildExerciseItem(exercises[i], i + 1),
          const SizedBox(height: AppDimensions.spaceM),
        ],
      ],
    );
  }

  Widget _buildInstruction(String instruction) {
    final hasArabic = _hasArabic(instruction);
    final hasLatinOrDigit = _hasLatinOrDigit(instruction);
    final isPureArabic = hasArabic && !hasLatinOrDigit;

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

  Widget _buildExerciseItem(ExerciseTableItem exercise, int index) {
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
          // Question text
          if (exercise.question.isNotEmpty) ...[
            _buildQuestionText(exercise.question),
            const SizedBox(height: AppDimensions.spaceM),
          ],

          // Options table
          _buildOptionsTable(exercise.options),
        ],
      ),
    );
  }

  Widget _buildQuestionText(String question) {
    final hasArabic = _hasArabic(question);
    final hasLatinOrDigit = _hasLatinOrDigit(question);
    final isPureArabic = hasArabic && !hasLatinOrDigit;

    return SizedBox(
      width: double.infinity,
      child: Text(
        question,
        style: isPureArabic
            ? AppTextStyles.arabicText.copyWith(
                fontSize: (AppTextStyles.arabicText.fontSize ?? 18) * fontScale,
                fontWeight: FontWeight.bold,
              )
            : AppTextStyles.bodyLarge.copyWith(
                fontSize: (AppTextStyles.bodyLarge.fontSize ?? 16) * fontScale,
                fontWeight: FontWeight.bold,
              ),
        textDirection: isPureArabic ? TextDirection.rtl : TextDirection.ltr,
        textAlign: isPureArabic ? TextAlign.right : TextAlign.left,
      ),
    );
  }

  Widget _buildOptionsTable(List<List<String>> options) {
    if (options.isEmpty) return const SizedBox.shrink();

    return Table(
      border: TableBorder.all(color: AppColors.borderLight, width: 1.0),
      children: options.map((row) {
        return TableRow(
          children: row.map((cell) {
            final hasArabic = _hasArabic(cell);
            final hasLatinOrDigit = _hasLatinOrDigit(cell);
            final isPureArabic = hasArabic && !hasLatinOrDigit;

            return Container(
              padding: const EdgeInsets.all(AppDimensions.paddingS),
              child: Text(
                cell,
                style: isPureArabic
                    ? AppTextStyles.arabicText.copyWith(
                        fontSize:
                            (AppTextStyles.arabicText.fontSize ?? 18) *
                            fontScale,
                      )
                    : AppTextStyles.bodyMedium.copyWith(
                        fontSize:
                            (AppTextStyles.bodyMedium.fontSize ?? 14) *
                            fontScale,
                      ),
                textDirection: isPureArabic
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                textAlign: isPureArabic ? TextAlign.right : TextAlign.center,
              ),
            );
          }).toList(),
        );
      }).toList(),
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

class ExerciseTableItem {
  final String question;
  final List<List<String>> options;

  const ExerciseTableItem({required this.question, required this.options});
}
