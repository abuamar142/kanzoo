import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class MahfudzotCard extends StatelessWidget {
  final String indonesian;
  final String arabic;

  const MahfudzotCard({
    super.key,
    required this.indonesian,
    required this.arabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: AppColors.alpha20),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: AppColors.alpha10),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quote icon
          Icon(
            Icons.format_quote,
            size: 32,
            color: AppColors.secondary.withValues(alpha: AppColors.alpha30),
          ),
          const SizedBox(height: AppDimensions.spaceM),

          // Arabic text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: AppColors.alpha05),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              border: Border.all(
                color: AppColors.secondary.withValues(alpha: AppColors.alpha10),
              ),
            ),
            child: Text(
              arabic,
              style: AppTextStyles.arabicText.copyWith(
                fontSize: 20,
                height: 1.8,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),

          const SizedBox(height: AppDimensions.spaceM),

          // Indonesian translation
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingS,
              horizontal: AppDimensions.paddingM,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: AppColors.alpha05),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            ),
            child: Text(
              indonesian,
              style: AppTextStyles.bodyMedium.copyWith(
                fontStyle: FontStyle.italic,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
