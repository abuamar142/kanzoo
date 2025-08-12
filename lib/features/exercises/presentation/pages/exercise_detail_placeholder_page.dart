import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_exercise.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/data/exercises_data.dart';
import '../../../../shared/models/exercise_set.dart';

class ExerciseDetailPlaceholderPage extends StatelessWidget {
  const ExerciseDetailPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'] ?? Get.arguments as String?;
    final ExerciseSet? set = id != null
        ? ExercisesData.sets.firstWhereOrNull((e) => e.id == id)
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(set?.title ?? AppConstants.exerciseTitle),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(AppDimensions.marginM),
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppConstants.exerciseDetailPending,
                style: AppTextStyles.h4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spaceM),
              if (set != null) ...[
                Text('Batas waktu: ${set.timeLimitSec ~/ 60} menit',
                    style: AppTextStyles.bodyMedium),
                Text('Nilai lulus: ${AppExercise.passingScore.toInt()}%',
                    style: AppTextStyles.bodyMedium),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

