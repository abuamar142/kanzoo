import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';

class CheckAllAnswersButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool showResults;
  final int correctAnswers;
  final int totalQuestions;
  final TextStyle textStyle;

  const CheckAllAnswersButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
    required this.showResults,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = totalQuestions > 0
        ? (correctAnswers / totalQuestions * 100).round()
        : 0;

    return Column(
      children: [
        // Helper text when button is disabled
        if (!isEnabled && !showResults) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDimensions.paddingS),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.warning,
                  size: AppDimensions.iconS,
                ),
                const SizedBox(width: AppDimensions.spaceS),
                Expanded(
                  child: Text(
                    'Lengkapi semua jawaban untuk melanjutkan',
                    style: textStyle.copyWith(
                      color: AppColors.warning,
                      fontSize: textStyle.fontSize! * 0.9,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spaceM),
        ],

        // Check All Answers Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.background,
              disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.3),
              disabledForegroundColor: AppColors.textSecondary,
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingM,
                horizontal: AppDimensions.paddingL,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              ),
              elevation: isEnabled ? 2 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: AppDimensions.iconS),
                const SizedBox(width: AppDimensions.spaceS),
                Text(
                  'Periksa Semua Jawaban',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isEnabled
                        ? AppColors.background
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Results Display
        if (showResults) ...[
          const SizedBox(height: AppDimensions.spaceM),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            decoration: BoxDecoration(
              color: percentage >= 70
                  ? AppColors.success.withValues(alpha: 0.1)
                  : percentage >= 50
                  ? AppColors.warning.withValues(alpha: 0.1)
                  : AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              border: Border.all(
                color: percentage >= 70
                    ? AppColors.success.withValues(alpha: 0.3)
                    : percentage >= 50
                    ? AppColors.warning.withValues(alpha: 0.3)
                    : AppColors.error.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      percentage >= 70
                          ? Icons.emoji_events
                          : percentage >= 50
                          ? Icons.thumb_up
                          : Icons.replay,
                      color: percentage >= 70
                          ? AppColors.success
                          : percentage >= 50
                          ? AppColors.warning
                          : AppColors.error,
                      size: AppDimensions.iconM,
                    ),
                    const SizedBox(width: AppDimensions.spaceS),
                    Text(
                      '$percentage%',
                      style: AppTextStyles.h3.copyWith(
                        color: percentage >= 70
                            ? AppColors.success
                            : percentage >= 50
                            ? AppColors.warning
                            : AppColors.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spaceXS),
                Text(
                  '$correctAnswers dari $totalQuestions soal benar',
                  style: textStyle.copyWith(
                    color: percentage >= 70
                        ? AppColors.success
                        : percentage >= 50
                        ? AppColors.warning
                        : AppColors.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppDimensions.spaceXS),
                Text(
                  percentage >= 70
                      ? 'Kerja bagus!'
                      : percentage >= 50
                      ? 'Terus berlatih!'
                      : 'Jangan menyerah!',
                  style: textStyle.copyWith(
                    color: percentage >= 70
                        ? AppColors.success
                        : percentage >= 50
                        ? AppColors.warning
                        : AppColors.error,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
