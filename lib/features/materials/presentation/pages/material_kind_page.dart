import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/breadcrumb/app_breadcrumb.dart';
import '../../../../core/widgets/materials/components/material_card.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/data/materials/chapter_materials_data.dart';
import '../../../../shared/shared.dart';

class MaterialKindPage extends StatelessWidget {
  const MaterialKindPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    final Chapter? chapter = args?['chapter'] as Chapter?;

    final Chapter activeChapter = chapter ?? Chapter.bab1;

    final chapterContent = ChapterMaterialsData.getByChapter(activeChapter);
    final availableKinds =
        chapterContent?.kinds.map((kindContent) => kindContent.kind).toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${activeChapter.title} - Jenis Materi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb Navigation
            AppBreadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Beranda',
                  icon: Icons.home,
                  onTap: () => Get.offAllNamed(AppRoutes.home),
                ),
                BreadcrumbItem(
                  label: activeChapter.title,
                  icon: Icons.menu_book,
                  isActive: true,
                ),
              ],
            ),

            const SizedBox(height: AppDimensions.spaceL),

            // Page Title
            Text(
              'Pilih Jenis Materi',
              style: AppTextStyles.h3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: AppDimensions.spaceS),

            Text(
              'Pilih jenis materi yang ingin dipelajari untuk ${activeChapter.title}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: AppDimensions.spaceM),

            // Material Types List
            ...availableKinds.map((kind) {
              return MaterialCard(
                title: kind.title,
                subtitle: kind.subtitle,
                icon: kind.icon,
                colors: kind.colors,
                onTap: () => Get.toNamed(
                  AppRoutes.materialDetail,
                  arguments: {'chapter': activeChapter, 'kind': kind},
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
