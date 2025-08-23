import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class TableSection extends MaterialSection {
  final List<String> headers;
  final List<List<String>> rows;

  const TableSection({required this.headers, required this.rows});

  @override
  Widget build(BuildContext context) {
    final fontController = Get.find<FontSizeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primary.withValues(alpha: AppColors.alpha20),
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          child: Table(
            border: TableBorder.all(
              color: AppColors.primary.withValues(alpha: AppColors.alpha10),
              width: 1,
            ),
            children: [
              // Headers row
              TableRow(
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: AppColors.alpha05),
                ),
                children: headers
                    .map(
                      (header) => Padding(
                        padding: EdgeInsets.all(AppDimensions.paddingS),
                        child: Obx(
                          () => Text(
                            header,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize:
                                  AppTextStyles.bodyMedium.fontSize! *
                                  fontController.fontScale,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              // Data rows
              ...rows.map(
                (row) => TableRow(
                  children: row.asMap().entries.map((entry) {
                    final isArabicColumn = entry.key == headers.length - 1;
                    return Padding(
                      padding: EdgeInsets.all(AppDimensions.paddingS),
                      child: Obx(
                        () => Text(
                          entry.value,
                          style: isArabicColumn
                              ? AppTextStyles.arabicText.copyWith(
                                  fontSize:
                                      AppTextStyles.arabicText.fontSize! *
                                      fontController.fontScale,
                                )
                              : AppTextStyles.bodyMedium.copyWith(
                                  fontSize:
                                      AppTextStyles.bodyMedium.fontSize! *
                                      fontController.fontScale,
                                ),
                          textAlign: isArabicColumn
                              ? TextAlign.right
                              : TextAlign.left,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
