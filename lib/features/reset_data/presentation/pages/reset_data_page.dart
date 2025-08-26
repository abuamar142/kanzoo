import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/reset_data_controller.dart';
import '../widgets/reset_data_item.dart';

class ResetDataPage extends StatelessWidget {
  const ResetDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetDataController());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.resetDataPageTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page description
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppDimensions.paddingM),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: AppColors.alpha10),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: AppColors.alpha30),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.info,
                    size: AppDimensions.iconM,
                  ),
                  SizedBox(width: AppDimensions.spaceM),
                  Expanded(
                    child: Text(
                      AppConstants.resetDataDescription,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.info,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.spaceXL),

            // Reset options
            Text(
              'Pilihan Reset Data',
              style: AppTextStyles.h3.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: AppDimensions.spaceL),

            // Reset Bab 1 Kitabah
            Obx(
              () => ResetDataItem(
                icon: Icons.quiz,
                title: AppConstants.resetBab1KitabahTitle,
                description: AppConstants.resetBab1KitabahDescription,
                onTap: controller.resetBab1Kitabah,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.warning,
              ),
            ),

            // Reset Bab 2 Kitabah
            Obx(
              () => ResetDataItem(
                icon: Icons.quiz,
                title: AppConstants.resetBab2KitabahTitle,
                description: AppConstants.resetBab2KitabahDescription,
                onTap: controller.resetBab2Kitabah,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.warning,
              ),
            ),

            // Exercise reset section
            Text(
              'Reset Latihan Audio (Istima)',
              style: AppTextStyles.h3.copyWith(color: AppColors.textPrimary),
            ),
            SizedBox(height: AppDimensions.spaceL),

            // Reset Bab 1 Istima
            Obx(
              () => ResetDataItem(
                icon: Icons.headphones,
                title: AppConstants.resetBab1IstimaTitle,
                description: AppConstants.resetBab1IstimaDescription,
                onTap: controller.resetBab1Istima,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.info,
              ),
            ),

            // Reset Bab 2 Istima
            Obx(
              () => ResetDataItem(
                icon: Icons.headphones,
                title: AppConstants.resetBab2IstimaTitle,
                description: AppConstants.resetBab2IstimaDescription,
                onTap: controller.resetBab2Istima,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.info,
              ),
            ),

            // Reset Bab 3 Istima
            Obx(
              () => ResetDataItem(
                icon: Icons.headphones,
                title: AppConstants.resetBab3IstimaTitle,
                description: AppConstants.resetBab3IstimaDescription,
                onTap: controller.resetBab3Istima,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.info,
              ),
            ),

            // Reset All Istima
            Obx(
              () => ResetDataItem(
                icon: Icons.headphones_outlined,
                title: AppConstants.resetAllIstimaTitle,
                description: AppConstants.resetAllIstimaDescription,
                onTap: controller.resetAllIstima,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.warning,
              ),
            ),

            // Divider
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.spaceL),
              child: Divider(color: AppColors.borderLight, thickness: 1),
            ),

            // Reset all exercises
            Obx(
              () => ResetDataItem(
                icon: Icons.sports_esports,
                title: AppConstants.resetAllExercisesTitle,
                description: AppConstants.resetAllExercisesDescription,
                onTap: controller.resetAllExercises,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.error,
              ),
            ),

            // Divider
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.spaceL),
              child: Divider(color: AppColors.borderLight, thickness: 1),
            ),

            // Reset all data
            Obx(
              () => ResetDataItem(
                icon: Icons.delete_forever,
                title: AppConstants.resetAllDataTitle,
                description: AppConstants.resetAllDataDescription,
                onTap: controller.resetAllData,
                isLoading: controller.isLoading.value,
                iconColor: AppColors.error,
              ),
            ),

            SizedBox(height: AppDimensions.spaceXL),

            // Warning note
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppDimensions.paddingM),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: AppColors.alpha10),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: AppColors.warning.withValues(alpha: AppColors.alpha30),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning_amber,
                    color: AppColors.warning,
                    size: AppDimensions.iconM,
                  ),
                  SizedBox(width: AppDimensions.spaceM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Peringatan',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppDimensions.spaceXS),
                        Text(
                          'Data yang sudah dihapus tidak dapat dikembalikan. Pastikan Anda yakin sebelum melakukan reset.',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
