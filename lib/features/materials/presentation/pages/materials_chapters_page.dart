import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../routes/app_routes.dart';

class MaterialsChaptersPage extends StatelessWidget {
  const MaterialsChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = [1, 2, 3];
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.materialsTitle)),
      drawer: const AppDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        itemBuilder: (context, index) {
          final c = chapters[index];
          return ListTile(
            leading: const Icon(Icons.book_outlined),
            title: Text('Bab $c', style: AppTextStyles.bodyLarge),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed('${AppRoutes.materialsChapter}/$c'),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: AppDimensions.spaceS),
        itemCount: chapters.length,
      ),
    );
  }
}

