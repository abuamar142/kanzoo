import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';

enum Kind {
  qiroah(
    id: 'qiroah',
    title: AppConstants.qiroahLabel,
    subtitle: 'Materi membaca teks Arab',
    icon: Icons.book,
    colors: [AppColors.primary, AppColors.primaryLight],
  ),
  kitabah(
    id: 'kitabah',
    title: AppConstants.kitabahLabel,
    subtitle: 'Materi menulis huruf Arab',
    icon: Icons.edit,
    colors: [AppColors.arabicGreen, AppColors.success],
  ),
  qowaid(
    id: 'qowaid',
    title: AppConstants.qowaidLabel,
    subtitle: 'Materi tata bahasa Arab',
    icon: Icons.school,
    colors: [AppColors.warning, AppColors.info],
  ),
  istima(
    id: 'istima',
    title: AppConstants.istimaLabel,
    subtitle: 'Materi mendengarkan Arab',
    icon: Icons.headphones,
    colors: [AppColors.info, AppColors.primary],
  ),
  kalam(
    id: 'kalam',
    title: AppConstants.kalamLabel,
    subtitle: 'Materi berbicara Arab',
    icon: Icons.record_voice_over,
    colors: [AppColors.error, AppColors.warning],
  ),
  mufrodat(
    id: 'mufrodat',
    title: AppConstants.mufrodatLabel,
    subtitle: 'Kosakata bahasa Arab',
    icon: Icons.menu_book,
    colors: [AppColors.arabicGreen, AppColors.primaryLight],
  ),
  mahfudzot(
    id: 'mahfudzot',
    title: AppConstants.mahfudzotLabel,
    subtitle: 'Materi hafalan Arab',
    icon: Icons.bookmark,
    colors: [AppColors.info, AppColors.success],
  );

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;

  const Kind({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
  });

  static Kind? findById(String id) {
    return Kind.values.firstWhere((k) => k.id == id, orElse: () => Kind.qiroah);
  }

  static Kind getById(String id) {
    return Kind.values.firstWhere((k) => k.id == id, orElse: () => Kind.qiroah);
  }

  static List<Kind> get all => Kind.values;

  static List<String> get allIds => Kind.values.map((k) => k.id).toList();
}
