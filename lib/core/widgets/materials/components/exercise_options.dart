import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../utils/string_extensions.dart';

class ExerciseOptions extends StatelessWidget {
  final List<String> options;
  final List<int> correctAnswerIndexes;
  final List<int> selectedAnswers; // For matching section (multiple)
  final int? selectedAnswer; // For completion section (single)
  final bool isCompleted;
  final bool isCorrect;
  final Function(int) onOptionTap;
  final TextStyle textStyle;

  const ExerciseOptions({
    super.key,
    required this.options,
    required this.correctAnswerIndexes,
    this.selectedAnswers = const [],
    this.selectedAnswer,
    required this.isCompleted,
    required this.isCorrect,
    required this.onOptionTap,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDimensions.spaceS,
      runSpacing: AppDimensions.spaceS,
      textDirection: TextDirection.rtl,
      children: options.asMap().entries.map((optionEntry) {
        final optionIndex = optionEntry.key;
        final option = optionEntry.value;

        // Check if this option is selected (works for both single and multiple selection)
        final isSelected =
            selectedAnswers.contains(optionIndex) ||
            selectedAnswer == optionIndex;

        Color backgroundColor = AppColors.surface;
        Color borderColor = AppColors.primary.withValues(alpha: 0.3);
        Color textColor = AppColors.textPrimary;

        if (isCompleted) {
          if (isSelected && !isCorrect) {
            // Wrong answer - show in red but don't reveal correct answer
            backgroundColor = AppColors.error.withValues(alpha: 0.2);
            borderColor = AppColors.error;
            textColor = AppColors.error;
          } else if (isSelected && isCorrect) {
            // Only show correct answer styling if student selected it correctly
            backgroundColor = AppColors.success.withValues(alpha: 0.2);
            borderColor = AppColors.success;
            textColor = AppColors.success;
          }
          // Don't highlight correct answer if student didn't select it
        } else if (isSelected) {
          backgroundColor = AppColors.primary.withValues(alpha: 0.1);
          borderColor = AppColors.primary;
          textColor = AppColors.primary;
        }

        return GestureDetector(
          onTap: isCompleted ? null : () => onOptionTap(optionIndex),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingM,
              vertical: AppDimensions.paddingS,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: Text(
              option,
              style: textStyle.copyWith(
                color: textColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              textAlign: option.isPrimarilyArabic
                  ? TextAlign.right
                  : TextAlign.left,
              textDirection: option.isPrimarilyArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        );
      }).toList(),
    );
  }
}
