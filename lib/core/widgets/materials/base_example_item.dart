import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseExampleItem extends StatelessWidget {
  final String arabic;
  final String translation;
  final double fontScale;

  const BaseExampleItem({
    super.key,
    required this.arabic,
    required this.translation,
    this.fontScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      margin: const EdgeInsets.only(bottom: AppDimensions.spaceS),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            arabic,
            style: AppTextStyles.arabicLarge.copyWith(
              fontSize: (AppTextStyles.arabicLarge.fontSize ?? 24) * fontScale,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: AppDimensions.spaceXS),
          Text(
            translation,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: (AppTextStyles.bodyMedium.fontSize ?? 14) * fontScale,
            ),
          ),
        ],
      ),
    );
  }
}
