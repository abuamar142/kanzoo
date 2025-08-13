import 'package:flutter/material.dart';

import '../../constants/app_exercise.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseExerciseItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int timeLimitSec;
  final VoidCallback onTap;

  const BaseExerciseItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeLimitSec,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            const Icon(Icons.quiz, color: AppColors.arabicGreen),
            const SizedBox(width: AppDimensions.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: AppDimensions.spaceXS),
                  Text(subtitle, style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            const SizedBox(width: AppDimensions.spaceM),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${timeLimitSec ~/ 60}m', style: AppTextStyles.label),
                Text('${AppExercise.passingScore.toInt()}%', style: AppTextStyles.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

