import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class NameFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const NameFormField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: AppColors.alpha05),
            blurRadius: AppDimensions.spaceS,
            offset: const Offset(0, AppDimensions.paddingXS),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: AppTextStyles.bodyMedium,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: AppConstants.namePlaceholder,
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.all(AppDimensions.paddingS),
            padding: const EdgeInsets.all(AppDimensions.paddingS),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: AppColors.alpha10),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            ),
            child: const Icon(
              Icons.person_outline,
              size: AppDimensions.iconS,
              color: AppColors.primary,
            ),
          ),
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: AppDimensions.strokeWidthThin,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: AppDimensions.strokeWidthThin,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: AppDimensions.strokeWidthThin,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingM,
          ),
        ),
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
