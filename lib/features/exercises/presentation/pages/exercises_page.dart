import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/exercises/base_exercise_item.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/data/exercises_data.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sets = ExercisesData.sets;

    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.exercisesListTitle)),
      drawer: const AppDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        itemCount: sets.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.spaceM),
        itemBuilder: (context, index) {
          final s = sets[index];
          return BaseExerciseItem(
            title: s.title,
            subtitle: s.description,
            timeLimitSec: s.timeLimitSec,
            onTap: () => Get.toNamed('${AppRoutes.exerciseDetail}/${s.id}'),
          );
        },
      ),
    );
  }
}

