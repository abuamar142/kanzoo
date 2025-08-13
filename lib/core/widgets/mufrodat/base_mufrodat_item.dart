import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseMufrodatItem extends StatelessWidget {
  final String indonesian;
  final String arabic;

  const BaseMufrodatItem({
    super.key,
    required this.indonesian,
    required this.arabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingS,
        horizontal: AppDimensions.paddingM,
      ),
      margin: const EdgeInsets.only(bottom: AppDimensions.spaceS),
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: AppColors.alpha10),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: AppColors.alpha30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              indonesian,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spaceM),
          Text(
            arabic,
            style: AppTextStyles.arabicText.copyWith(
              color: AppColors.secondary,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
