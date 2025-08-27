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
  final TextDirection? textDirection;

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
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDimensions.spaceS,
      runSpacing: AppDimensions.spaceS,
      textDirection: textDirection,
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
          // Only show if the selected answer is wrong - don't reveal correct answers
          if (isSelected && !isCorrect) {
            backgroundColor = AppColors.error.withValues(alpha: 0.2);
            borderColor = AppColors.error;
            textColor = AppColors.error;
          }
          // Don't highlight correct answers - keep them neutral
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
