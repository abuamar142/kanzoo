import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
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
          final gradients = const [
            [AppColors.primary, AppColors.primaryLight],
            [AppColors.arabicGreen, AppColors.success],
            [AppColors.warning, AppColors.info],
          ];
          final pair = gradients[index % gradients.length];

          return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: pair,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor.withValues(
                      alpha: AppColors.alpha10,
                    ),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.menu_book,
                color: AppColors.secondary,
                size: AppDimensions.iconM,
              ),
            ),
            title: Text('Bab $c', style: AppTextStyles.bodyLarge),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed('${AppRoutes.materialsChapter}/$c'),
          );
        },
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppDimensions.spaceS),
        itemCount: chapters.length,
      ),
    );
  }
}
