import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/breadcrumb/app_breadcrumb.dart';
import '../../../../routes/app_routes.dart';

class MaterialsChapterTopicsPage extends StatelessWidget {
  const MaterialsChapterTopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String chapter = Get.parameters['chapter'] ?? '1';

    // Material types with their icons and colors
    final materialTypes = [
      {
        'id': 'qiroah',
        'title': AppConstants.qiroahLabel,
        'subtitle': 'Materi membaca teks Arab',
        'icon': Icons.book,
        'colors': [AppColors.primary, AppColors.primaryLight],
      },
      {
        'id': 'kitabah',
        'title': AppConstants.kitabahLabel,
        'subtitle': 'Materi menulis huruf Arab',
        'icon': Icons.edit,
        'colors': [AppColors.arabicGreen, AppColors.success],
      },
      {
        'id': 'qowaid',
        'title': AppConstants.qowaidLabel,
        'subtitle': 'Materi tata bahasa Arab',
        'icon': Icons.school,
        'colors': [AppColors.warning, AppColors.info],
      },
      {
        'id': 'istima',
        'title': AppConstants.istimaLabel,
        'subtitle': 'Materi mendengarkan Arab',
        'icon': Icons.headphones,
        'colors': [AppColors.info, AppColors.primary],
      },
      {
        'id': 'kalam',
        'title': AppConstants.kalamLabel,
        'subtitle': 'Materi berbicara Arab',
        'icon': Icons.record_voice_over,
        'colors': [AppColors.error, AppColors.warning],
      },
      {
        'id': 'mufrodat',
        'title': AppConstants.mufrodatLabel,
        'subtitle': 'Kosakata bahasa Arab',
        'icon': Icons.menu_book,
        'colors': [AppColors.arabicGreen, AppColors.primaryLight],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Bab $chapter - Jenis Materi')),
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
                  label: 'Bab $chapter',
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
              'Pilih jenis materi yang ingin dipelajari untuk Bab $chapter',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: AppDimensions.spaceM),

            // Material Types List
            ...materialTypes.map((material) {
              final colors = material['colors'] as List<Color>;
              return Container(
                margin: const EdgeInsets.only(bottom: AppDimensions.spaceM),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    onTap: () => Get.toNamed(
                      '${AppRoutes.materialsKindDetail}/$chapter/${material['id']}',
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppDimensions.paddingM),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusM,
                        ),
                        border: Border.all(color: AppColors.borderLight),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor.withValues(
                              alpha: AppColors.alpha05,
                            ),
                            blurRadius: AppDimensions.spaceS,
                            offset: const Offset(0, AppDimensions.spaceXS),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: colors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: colors[0].withValues(
                                    alpha: AppColors.alpha30,
                                  ),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              material['icon'] as IconData,
                              color: AppColors.surface,
                              size: AppDimensions.iconL,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.spaceM),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  material['title'] as String,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: AppDimensions.spaceXS),
                                Text(
                                  material['subtitle'] as String,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              AppDimensions.paddingXS,
                            ),
                            decoration: BoxDecoration(
                              color: colors[0].withValues(
                                alpha: AppColors.alpha10,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusS,
                              ),
                            ),
                            child: Icon(
                              Icons.chevron_right,
                              color: colors[0],
                              size: AppDimensions.iconS,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
