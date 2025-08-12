import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class ClassPicker extends StatelessWidget {
  final String? selectedClass;
  final VoidCallback onTap;

  const ClassPicker({
    super.key,
    required this.selectedClass,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(
              alpha: AppColors.alphaVeryLow,
            ),
            blurRadius: AppDimensions.spaceS,
            offset: const Offset(0, AppDimensions.paddingXS),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        color: AppColors.surface,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingS,
              vertical: AppDimensions.paddingS,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: AppDimensions.spaceS),
                  padding: const EdgeInsets.all(AppDimensions.paddingS),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(
                      alpha: AppColors.alphaLow,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                  ),
                  child: const Icon(
                    Icons.school,
                    size: AppDimensions.iconS,
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: Text(
                    selectedClass != null
                        ? '${AppConstants.classPrefix} $selectedClass'
                        : AppConstants.classPlaceholder,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: selectedClass != null
                          ? AppColors.textPrimary
                          : AppColors.textHint,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingXS),
                  decoration: BoxDecoration(
                    color: AppColors.borderLight.withValues(
                      alpha: AppColors.alphaHigh,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: AppDimensions.iconS,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
