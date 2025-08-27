import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';

class ExerciseContainer extends StatelessWidget {
  final bool isCompleted;
  final bool isCorrect;
  final Widget child;

  const ExerciseContainer({
    super.key,
    required this.isCompleted,
    required this.isCorrect,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spaceL),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.surface, // Keep neutral color always
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border: Border.all(
            color: AppColors.primary.withValues(
              alpha: 0.3,
            ), // Keep neutral border
            width: 2,
          ),
        ),
        child: child,
      ),
    );
  }
}
