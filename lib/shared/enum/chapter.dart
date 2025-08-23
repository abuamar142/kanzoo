import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum Chapter {
  general(
    id: 0,
    title: 'General',
    gradientColors: [AppColors.primary, AppColors.primaryLight],
  ),
  bab1(
    id: 1,
    title: 'Bab 1',
    gradientColors: [AppColors.primary, AppColors.primaryLight],
  ),
  bab2(
    id: 2,
    title: 'Bab 2',
    gradientColors: [AppColors.arabicGreen, AppColors.success],
  ),
  bab3(
    id: 3,
    title: 'Bab 3',
    gradientColors: [AppColors.warning, AppColors.info],
  );

  final int id;
  final String title;
  final List<Color> gradientColors;

  const Chapter({
    required this.id,
    required this.title,
    required this.gradientColors,
  });

  static List<Chapter> get all => Chapter.values;

  static Chapter? findById(int id) =>
      Chapter.values.firstWhere((c) => c.id == id, orElse: () => Chapter.bab1);

  static List<int> get allIds => Chapter.values.map((c) => c.id).toList();
}
